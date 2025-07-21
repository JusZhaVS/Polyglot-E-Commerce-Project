import { Injectable } from '@angular/core';
import { BehaviorSubject, Observable, tap } from 'rxjs';
import { Router } from '@angular/router';
import { ApiService } from './api.service';
import { AuthResponse, User } from '../models';

@Injectable({
  providedIn: 'root'
})
export class AuthService {
  private currentUserSubject: BehaviorSubject<User | null>;
  public currentUser: Observable<User | null>;

  constructor(
    private apiService: ApiService,
    private router: Router
  ) {
    const storedUser = localStorage.getItem('user');
    this.currentUserSubject = new BehaviorSubject<User | null>(
      storedUser ? JSON.parse(storedUser) : null
    );
    this.currentUser = this.currentUserSubject.asObservable();
  }

  public get currentUserValue(): User | null {
    return this.currentUserSubject.value;
  }

  login(email: string, password: string): Observable<AuthResponse> {
    return this.apiService.login(email, password).pipe(
      tap(response => {
        if (response.role === 'ADMIN') {
          localStorage.setItem('token', response.token);
          const user: User = {
            id: 0, // This would come from the backend
            email: response.email,
            firstName: response.firstName,
            lastName: response.lastName,
            role: response.role,
            enabled: true
          };
          localStorage.setItem('user', JSON.stringify(user));
          this.currentUserSubject.next(user);
        } else {
          throw new Error('Access denied. Admin role required.');
        }
      })
    );
  }

  logout(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    this.currentUserSubject.next(null);
    this.router.navigate(['/login']);
  }

  isAuthenticated(): boolean {
    return !!this.currentUserValue && this.currentUserValue.role === 'ADMIN';
  }
}