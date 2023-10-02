package com.example.bt2.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseRepository {
    private static final String JDBC_URL="jdbc:mysql://localhost:3306/UserManager";
    private static final String USERNAME = "root";
    private static final String PASSWORK = "root@123";

    public BaseRepository() {
    }
    public static Connection getConnection (){
        Connection connection=null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL,USERNAME,PASSWORK);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        return connection;
    }
}
