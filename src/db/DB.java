package db;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author sayz
 */

import java.sql.*;

public class DB {
    private static String url = "jdbc:mysql://localhost:3306/dentist";
    private static String username = "root";
    private static String password = "1234";

    static {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // You don't need to load it on every single opened connection.
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
}
