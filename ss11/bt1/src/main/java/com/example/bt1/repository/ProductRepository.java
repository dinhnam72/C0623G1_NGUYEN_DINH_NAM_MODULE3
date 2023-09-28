package com.example.bt1.repository;

import com.example.bt1.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> productList;
    static {
        productList=new ArrayList<>();
        productList.add(new Product(1,"Sting",10000,"2023-05-07","2023-07-15"));
        productList.add(new Product(2,"Redbull",15000,"2023-01-07","2023-06-24"));
        productList.add(new Product(3,"Caffe",15000,"2022-01-10","2023-02-15"));
        productList.add(new Product(4,"Trà đào",25000,"2023-08-01","2023-08-02"));
        productList.add(new Product(5,"Sinh tố dâu",30000,"2023-09-14","2023-09-15"));
    }
    @Override
    public List<Product> getAll() {

        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        productList.add(product);
    }

    @Override
    public int checkId(int id) {
        int index = productList.indexOf(new Product(id));
        return index;
    }

    @Override
    public void editProduct(int id, Product product) {
        int index = checkId(id);
        productList.set(index,product);
    }

    @Override
    public void removeProduct(int id) {
        int index = checkId(id);
        productList.remove(index);
    }

    @Override
    public Product detailProduct(int id) {
        int index = checkId(id);
        Product product = productList.get(index);
        return product;
    }

    @Override
    public List<Product> searchProduct(String name) {
        List<Product> products = new ArrayList<>();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getName().contains(name)){
                products.add(productList.get(i));
            }
        }
        return products;
    }

}
