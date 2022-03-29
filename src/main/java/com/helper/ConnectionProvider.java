package com.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
                //driver class load
                Class.forName("com.mysql.jdbc.Driver");

                //create a connection..
                con = DriverManager.getConnection(
                		//"jdbc:mysql://localhost:3306/groupproject", "root", "lishien1210"
                		//"jdbc:mysql://localhost:3306/forum", "root", "867217"
                		"jdbc:mysql://localhost:3306/groupproject", "swe1902119", "swe1902119"
                		);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }

}
