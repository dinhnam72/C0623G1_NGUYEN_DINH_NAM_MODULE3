package com.example.bt1usermanager.repository;

import com.example.bt1usermanager.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    private static final String SELECT = "SELECT*FROM users ORDER BY `name`";
    private static final String INSERT = "INSERT INTO users(`name`,`email`,`country`)" +
            " values(?,?,?);";
    private static final String DELETE = "DELETE FROM users\n" +
            "WHERE id = ?";
    private static final String UPDATE = "UPDATE  users\n" +
            "SET `name`=?,email=?,country=?\n" +
            "WHERE id = ?;";

    private static final String SEARCH = "SELECT * FROM users\n" +
            "WHERE country = ?";

    @Override
    public List<User> getAll() {
        Connection connection = BaseRepository.getConnection();
        List<User> userList = new ArrayList<>();
        User user = null;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                userList.add(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return userList;
    }

    @Override
    public int checkId(int id) {
        List<User> userList = getAll();
        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getId() == id) {
                return i;
            }
        }
        return -1;
    }

    @Override
    public void add(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public void update(int id, User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    public List<User> searchByCountry(String searchCountry) {
        List<User> searchByCountry = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        User user = null;
        try {

            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, searchCountry);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                user = new User(id, name, email, country);
                searchByCountry.add(user);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        return searchByCountry;
    }

    @Override
    public void remove(int id) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
