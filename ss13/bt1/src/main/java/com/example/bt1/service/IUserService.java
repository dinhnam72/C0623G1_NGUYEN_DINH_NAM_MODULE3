package com.example.bt1usermanager.service;

import com.example.bt1usermanager.model.User;

import java.util.List;

public interface IUserService {
    List<User> display();

    void addUser(User user);

    void updateUser(int id, User user);

    void removeUser(int id);

    List<User> searchByCountry(String country);

    User findById(int id);
}
