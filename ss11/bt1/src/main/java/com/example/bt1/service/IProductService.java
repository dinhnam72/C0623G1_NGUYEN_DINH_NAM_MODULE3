package com.example.bt1.service;

import com.example.bt1.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> display();

    void addProduct(Product product);

    void editProduct(int id, Product product);

    void removeProduct(int id);

    Product detailProduct(int id);

    List<Product> searchProduct(String name);
    Product findById(int id);
}
