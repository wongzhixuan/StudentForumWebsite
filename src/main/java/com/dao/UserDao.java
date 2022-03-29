/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;
import com.entities.User;
import com.helper.ConnectionProvider;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    //method to insert user to data base:
    public static boolean saveUser(User user) {
        boolean f = false;
        try {
            //user -->database
        	Connection con = ConnectionProvider.getConnection();
            String query = "insert into user(name,email,password,gender,about) values (?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getAbout());

            pstmt.executeUpdate();
            f = true;
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public static User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {
        	Connection con = ConnectionProvider.getConnection();
            String query = "select * from user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getString("rdate"));
                user.setProfile(set.getString("profile"));

            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static boolean updateUser(User user) {

        boolean f = false;
        try {
        	Connection con = ConnectionProvider.getConnection();
            String query = "update user set name=? , email=? , password=? , gender=? ,about=? , profile=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getAbout());
            p.setString(6, user.getProfile());
            p.setInt(7, user.getId());

            p.executeUpdate();
            f = true;

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public static User getUserByUserId(int userId) {
        User user = null;
        try {
        	Connection con = ConnectionProvider.getConnection();
            String q = "select * from user where id=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getString("rdate"));
                user.setProfile(set.getString("profile"));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public static List<User> getAllRecords(){
        List<User> ls = new ArrayList<User>();
        try {
        	Connection con = ConnectionProvider.getConnection();
            String q = "select * from user";
            PreparedStatement ps = con.prepareStatement(q);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                User user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getString("rdate"));
                user.setProfile(set.getString("profile"));
                
                ls.add(user);
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return ls;
    }
    
    public static int deleteUser(User u){
    	int status=0;
    	try{
    		Connection con = ConnectionProvider.getConnection();
    		PreparedStatement ps = con.prepareStatement("delete from user where id=?");
    		ps.setInt(1,u.getId());
    		status = ps.executeUpdate();
    	}catch(Exception e){System.out.println(e);}

    	return status;
    }
}
