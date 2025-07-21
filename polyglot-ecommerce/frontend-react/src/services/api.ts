import axios from 'axios';
import { AuthResponse, Product, Order, CartItem } from '../types';

const API_BASE_URL = 'http://localhost:8080/api';

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json',
  },
});

api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token');
  if (token) {
    config.headers.Authorization = `Bearer ${token}`;
  }
  return config;
});

export const authApi = {
  login: (email: string, password: string) =>
    api.post<AuthResponse>('/auth/login', { email, password }),
  
  register: (data: { firstName: string; lastName: string; email: string; password: string }) =>
    api.post<AuthResponse>('/auth/register', data),
};

export const productApi = {
  getAll: () => api.get<Product[]>('/products'),
  getById: (id: number) => api.get<Product>(`/products/${id}`),
  getByCategory: (categoryId: number) => api.get<Product[]>(`/products/category/${categoryId}`),
  search: (query: string) => api.get<Product[]>(`/products/search?query=${query}`),
};

export const orderApi = {
  create: (items: CartItem[]) => api.post<Order>('/orders', { items }),
  getUserOrders: () => api.get<Order[]>('/orders'),
  getById: (id: number) => api.get<Order>(`/orders/${id}`),
};

export default api;