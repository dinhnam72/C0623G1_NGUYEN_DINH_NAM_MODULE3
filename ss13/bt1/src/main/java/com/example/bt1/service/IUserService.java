package com.example.bt1.service;

import com.example.bt1.model.User;

import java.util.List;

public interface IUserService {
    List<User> display();

    void addUser(User user);

    void updateUser(int id, User user);

    void removeUser(int id);

    List<User> searchByCountry(String country);

    User findById(int id);
}
