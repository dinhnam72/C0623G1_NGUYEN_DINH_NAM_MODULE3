package com.example.bt1.service;

import com.example.bt1.model.Product;
import com.example.bt1.repository.IProductRepository;
import com.example.bt1.repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
    private IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> display() {
        return productRepository.getAll();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.saveProduct(product);

    }

    @Override
    public void editProduct(int id, Product product) {
        productRepository.editProduct(id, product);
    }

    @Override
    public void removeProduct(int id) {
        productRepository.removeProduct(id);
    }

    @Override
    public Product detailProduct(int id) {
        Product product = productRepository.detailProduct(id);
        return product;
    }

    @Override
    public Product searchProduct(String name) {
        return null;
    }

    @Override
    public Product findById(int id) {
        List<Product> productList = productRepository.getAll();
        int index = productRepository.checkId(id);
        return productList.get(index);
    }

}
