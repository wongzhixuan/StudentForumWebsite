package com.dao;

import java.sql.*;

import com.helper.ConnectionProvider;

public class LikeDao {
    public static boolean insertLike(int pid, int uid) {
        boolean f = false;
        try {
        	Connection con = ConnectionProvider.getConnection();
            String q = "insert into liked(pid,uid)values(?,?)";
            PreparedStatement p = con.prepareStatement(q);
            //values set...
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    public static int countLikeOnPost(int pid) {
        int count = 0;

        String q = "select count(*) from liked where pid=?";
        try {
        	Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, pid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                count = set.getInt("count(*)");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static boolean isLikedByUser(int pid, int uid) {
        boolean f = false;
        try {
        	Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement("select * from liked where pid=? and uid=?");
            p.setInt(1, pid);
            p.setInt(2, uid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                f = true;
            }

            con.close();
        } catch (Exception e) {
        }
        return f;
    }

    public static boolean deleteLike(int pid, int uid) {
        boolean f = false;
        try {
        	Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement("delete from liked where pid=? and uid=? ");
            p.setInt(1, pid);
            p.setInt(2, uid);
            p.executeUpdate();
            f = true;
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
}
