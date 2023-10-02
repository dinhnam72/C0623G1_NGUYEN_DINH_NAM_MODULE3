package com.example.bt1usermanager.repository;

import com.example.bt1usermanager.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getAll();
    int checkId(int id);
    void add(User user);
    void update(int id,User user);
    List<User> searchByCountry(String searchCountry);
    void remove(int id);
}
