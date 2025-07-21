export interface User {
  email: string;
  firstName: string;
  lastName: string;
  role: 'CUSTOMER' | 'ADMIN';
}

export interface AuthResponse {
  token: string;
  email: string;
  firstName: string;
  lastName: string;
  role: 'CUSTOMER' | 'ADMIN';
}

export interface Product {
  id: number;
  name: string;
  description: string;
  price: number;
  stock: number;
  imageUrl: string;
  category: Category;
  active: boolean;
}

export interface Category {
  id: number;
  name: string;
  description: string;
}

export interface CartItem {
  productId: number;
  quantity: number;
}

export interface Order {
  id: number;
  orderItems: OrderItem[];
  status: 'PENDING' | 'PROCESSING' | 'SHIPPED' | 'DELIVERED' | 'CANCELLED';
  totalAmount: number;
  createdAt: string;
  updatedAt: string;
}

export interface OrderItem {
  id: number;
  product: Product;
  quantity: number;
  price: number;
}