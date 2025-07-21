import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AuthResponse, Product, Order, User, DashboardStats } from '../models';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private apiUrl = 'http://localhost:8080/api';

  constructor(private http: HttpClient) {}

  private getHeaders(): HttpHeaders {
    const token = localStorage.getItem('token');
    return new HttpHeaders({
      'Content-Type': 'application/json',
      'Authorization': token ? `Bearer ${token}` : ''
    });
  }

  // Auth endpoints
  login(email: string, password: string): Observable<AuthResponse> {
    return this.http.post<AuthResponse>(`${this.apiUrl}/auth/login`, { email, password });
  }

  // Product endpoints
  getProducts(): Observable<Product[]> {
    return this.http.get<Product[]>(`${this.apiUrl}/products`, { headers: this.getHeaders() });
  }

  getProduct(id: number): Observable<Product> {
    return this.http.get<Product>(`${this.apiUrl}/products/${id}`, { headers: this.getHeaders() });
  }

  createProduct(product: Product): Observable<Product> {
    return this.http.post<Product>(`${this.apiUrl}/admin/products`, product, { headers: this.getHeaders() });
  }

  updateProduct(id: number, product: Product): Observable<Product> {
    return this.http.put<Product>(`${this.apiUrl}/admin/products/${id}`, product, { headers: this.getHeaders() });
  }

  deleteProduct(id: number): Observable<void> {
    return this.http.delete<void>(`${this.apiUrl}/admin/products/${id}`, { headers: this.getHeaders() });
  }

  // Order endpoints
  getOrders(): Observable<Order[]> {
    return this.http.get<Order[]>(`${this.apiUrl}/orders`, { headers: this.getHeaders() });
  }

  updateOrderStatus(id: number, status: string): Observable<Order> {
    return this.http.put<Order>(`${this.apiUrl}/admin/orders/${id}/status?status=${status}`, {}, { headers: this.getHeaders() });
  }

  // Dashboard stats (mock for now)
  getDashboardStats(): Observable<DashboardStats> {
    // This would be a real endpoint in production
    return new Observable(observer => {
      setTimeout(() => {
        observer.next({
          totalRevenue: 125430.50,
          totalOrders: 324,
          totalProducts: 156,
          totalUsers: 1247,
          recentOrders: [],
          salesByMonth: [
            { month: 'Jan', sales: 12000 },
            { month: 'Feb', sales: 15000 },
            { month: 'Mar', sales: 18000 },
            { month: 'Apr', sales: 22000 },
            { month: 'May', sales: 25000 },
            { month: 'Jun', sales: 33430.50 }
          ]
        });
        observer.complete();
      }, 500);
    });
  }
}