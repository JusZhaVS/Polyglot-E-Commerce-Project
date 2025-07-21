import React from 'react';
import {
  Container,
  Typography,
  Box,
  Button,
  Paper,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  IconButton,
} from '@mui/material';
import { Add, Remove, Delete } from '@mui/icons-material';
import { useNavigate } from 'react-router-dom';
import { useCart } from '../contexts/CartContext';
import { useAuth } from '../contexts/AuthContext';
import { orderApi } from '../services/api';

const CartPage: React.FC = () => {
  const navigate = useNavigate();
  const { items, updateQuantity, removeFromCart, getTotalPrice, clearCart } = useCart();
  const { isAuthenticated } = useAuth();

  const handleCheckout = async () => {
    if (!isAuthenticated) {
      navigate('/login');
      return;
    }

    try {
      const orderItems = items.map((item) => ({
        productId: item.product.id,
        quantity: item.quantity,
      }));
      
      await orderApi.create(orderItems);
      clearCart();
      navigate('/orders');
    } catch (error) {
      console.error('Failed to create order:', error);
    }
  };

  if (items.length === 0) {
    return (
      <Container maxWidth="md" sx={{ mt: 4 }}>
        <Typography variant="h4" gutterBottom>
          Your Cart
        </Typography>
        <Typography variant="body1" sx={{ mt: 2 }}>
          Your cart is empty. Start shopping!
        </Typography>
        <Button
          variant="contained"
          sx={{ mt: 2 }}
          onClick={() => navigate('/')}
        >
          Continue Shopping
        </Button>
      </Container>
    );
  }

  return (
    <Container maxWidth="md" sx={{ mt: 4, mb: 4 }}>
      <Typography variant="h4" gutterBottom>
        Your Cart
      </Typography>
      
      <TableContainer component={Paper}>
        <Table>
          <TableHead>
            <TableRow>
              <TableCell>Product</TableCell>
              <TableCell align="right">Price</TableCell>
              <TableCell align="center">Quantity</TableCell>
              <TableCell align="right">Total</TableCell>
              <TableCell align="center">Actions</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {items.map((item) => (
              <TableRow key={item.product.id}>
                <TableCell>{item.product.name}</TableCell>
                <TableCell align="right">${item.product.price.toFixed(2)}</TableCell>
                <TableCell align="center">
                  <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                    <IconButton
                      size="small"
                      onClick={() => updateQuantity(item.product.id, item.quantity - 1)}
                    >
                      <Remove />
                    </IconButton>
                    <Typography sx={{ mx: 2 }}>{item.quantity}</Typography>
                    <IconButton
                      size="small"
                      onClick={() => updateQuantity(item.product.id, item.quantity + 1)}
                      disabled={item.quantity >= item.product.stock}
                    >
                      <Add />
                    </IconButton>
                  </Box>
                </TableCell>
                <TableCell align="right">
                  ${(item.product.price * item.quantity).toFixed(2)}
                </TableCell>
                <TableCell align="center">
                  <IconButton
                    color="error"
                    onClick={() => removeFromCart(item.product.id)}
                  >
                    <Delete />
                  </IconButton>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      
      <Box sx={{ mt: 3, display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
        <Typography variant="h5">
          Total: ${getTotalPrice().toFixed(2)}
        </Typography>
        <Box>
          <Button
            variant="outlined"
            sx={{ mr: 2 }}
            onClick={() => navigate('/')}
          >
            Continue Shopping
          </Button>
          <Button
            variant="contained"
            onClick={handleCheckout}
          >
            Checkout
          </Button>
        </Box>
      </Box>
    </Container>
  );
};

export default CartPage;