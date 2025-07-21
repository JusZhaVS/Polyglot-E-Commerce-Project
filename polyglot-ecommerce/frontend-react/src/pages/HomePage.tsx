import React, { useState, useEffect } from 'react';
import { Container, Grid, Typography, TextField, Box, CircularProgress } from '@mui/material';
import ProductCard from '../components/products/ProductCard';
import { Product } from '../types';
import { productApi } from '../services/api';

const HomePage: React.FC = () => {
  const [products, setProducts] = useState<Product[]>([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    fetchProducts();
  }, []);

  const fetchProducts = async () => {
    try {
      setLoading(true);
      const response = await productApi.getAll();
      setProducts(response.data);
    } catch (err) {
      setError('Failed to load products');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const handleSearch = async (term: string) => {
    setSearchTerm(term);
    if (term.trim() === '') {
      fetchProducts();
      return;
    }

    try {
      setLoading(true);
      const response = await productApi.search(term);
      setProducts(response.data);
    } catch (err) {
      setError('Failed to search products');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <Box display="flex" justifyContent="center" alignItems="center" minHeight="80vh">
        <CircularProgress />
      </Box>
    );
  }

  if (error) {
    return (
      <Container maxWidth="lg" sx={{ mt: 4 }}>
        <Typography variant="h6" color="error">
          {error}
        </Typography>
      </Container>
    );
  }

  return (
    <Container maxWidth="lg" sx={{ mt: 4, mb: 4 }}>
      <Typography variant="h4" component="h1" gutterBottom>
        Welcome to Our Store
      </Typography>
      
      <TextField
        fullWidth
        label="Search products..."
        variant="outlined"
        value={searchTerm}
        onChange={(e) => handleSearch(e.target.value)}
        sx={{ mb: 4 }}
      />

      <Grid container spacing={3}>
        {products.map((product) => (
          <Grid item key={product.id} xs={12} sm={6} md={4} lg={3}>
            <ProductCard product={product} />
          </Grid>
        ))}
      </Grid>

      {products.length === 0 && (
        <Typography variant="h6" textAlign="center" sx={{ mt: 4 }}>
          No products found
        </Typography>
      )}
    </Container>
  );
};

export default HomePage;