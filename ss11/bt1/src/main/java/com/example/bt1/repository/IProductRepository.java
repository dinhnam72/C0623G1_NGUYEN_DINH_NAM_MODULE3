package com.example.bt1.repository;

import com.example.bt1.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();

    void saveProduct(Product product);

    int checkId(int id);

    void editProduct(int id, Product product);

    void removeProduct(int id);

    Product detailProduct(int id);

    List<Product> searchProduct(String name);

}
