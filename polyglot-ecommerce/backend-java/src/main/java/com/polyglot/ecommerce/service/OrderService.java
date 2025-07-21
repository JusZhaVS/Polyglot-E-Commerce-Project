package com.polyglot.ecommerce.service;

import com.polyglot.ecommerce.dto.CreateOrderDto;
import com.polyglot.ecommerce.model.Order;
import com.polyglot.ecommerce.model.OrderItem;
import com.polyglot.ecommerce.model.Product;
import com.polyglot.ecommerce.model.User;
import com.polyglot.ecommerce.repository.OrderRepository;
import com.polyglot.ecommerce.repository.ProductRepository;
import com.polyglot.ecommerce.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@RequiredArgsConstructor
public class OrderService {
    
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;
    private final ProductRepository productRepository;
    
    @Transactional
    public Order createOrder(CreateOrderDto createOrderDto) {
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        User user = userRepository.findByEmail(userEmail)
                .orElseThrow(() -> new RuntimeException("User not found"));
        
        Order order = new Order();
        order.setUser(user);
        order.setStatus(Order.OrderStatus.PENDING);
        
        Set<OrderItem> orderItems = new HashSet<>();
        BigDecimal totalAmount = BigDecimal.ZERO;
        
        for (var itemDto : createOrderDto.getItems()) {
            Product product = productRepository.findById(itemDto.getProductId())
                    .orElseThrow(() -> new RuntimeException("Product not found"));
            
            if (product.getStock() < itemDto.getQuantity()) {
                throw new RuntimeException("Insufficient stock for product: " + product.getName());
            }
            
            OrderItem orderItem = new OrderItem();
            orderItem.setOrder(order);
            orderItem.setProduct(product);
            orderItem.setQuantity(itemDto.getQuantity());
            orderItem.setPrice(product.getPrice());
            
            orderItems.add(orderItem);
            
            totalAmount = totalAmount.add(product.getPrice().multiply(BigDecimal.valueOf(itemDto.getQuantity())));
            
            product.setStock(product.getStock() - itemDto.getQuantity());
            productRepository.save(product);
        }
        
        order.setOrderItems(orderItems);
        order.setTotalAmount(totalAmount);
        
        return orderRepository.save(order);
    }
    
    public List<Order> getUserOrders() {
        String userEmail = SecurityContextHolder.getContext().getAuthentication().getName();
        return orderRepository.findByUserEmail(userEmail);
    }
    
    public Order getOrderById(Long id) {
        return orderRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Order not found"));
    }
    
    public Order updateOrderStatus(Long id, Order.OrderStatus status) {
        Order order = getOrderById(id);
        order.setStatus(status);
        return orderRepository.save(order);
    }
}