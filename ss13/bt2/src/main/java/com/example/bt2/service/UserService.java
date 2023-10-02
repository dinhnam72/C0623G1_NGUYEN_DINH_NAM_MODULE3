package com.example.bt2.service;

import com.example.bt2.model.User;
import com.example.bt2.repository.IUserRepository;
import com.example.bt2.repository.UserRepository;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository userRepository = new UserRepository();

    @Override
    public List<User> display() {
        return userRepository.getAll();
    }

    @Override
    public void addUser(User user) {
        userRepository.add(user);
    }

    @Override
    public void updateUser(int id, User user) {
        userRepository.update(id, user);
    }

    @Override
    public void removeUser(int id) {
        userRepository.remove(id);
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> searchByCountry = userRepository.searchByCountry(country);
        if (searchByCountry.size()==0){
            return null;
        }else {
            return searchByCountry;
        }

    }

    @Override
    public User findById(int id) {
        List<User> userList = userRepository.getAll();
        int index = userRepository.checkId(id);
        if (index == -1) {
            return null;
        } else {
            return userList.get(index);
        }
    }
}
