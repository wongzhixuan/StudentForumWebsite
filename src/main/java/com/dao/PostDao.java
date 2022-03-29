/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.entities.Category;
import com.entities.Post;
import com.helper.ConnectionProvider;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    public static ArrayList<Category> getAllCategories() {
        ArrayList<Category> list = new ArrayList<>();

        try {
        	Connection con = ConnectionProvider.getConnection();
            String q = "select * from categories";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(q);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }

			con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public static int savePost(Post p) {
        int f = -1;
        try {
        	Connection con = ConnectionProvider.getConnection();
            String q = "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, p.getpTitle());
            pstmt.setString(2, p.getpContent());
            pstmt.setString(3, p.getpCode());
            pstmt.setString(4, p.getpPic());
            pstmt.setInt(5, p.getCatId());
            pstmt.setInt(6, p.getUserId());
            pstmt.executeUpdate();
            
            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next()) {
            	f = rs.getInt(1);
            }
            

			con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

//    get all the posts
    public static List<Post> getAllPosts() {

        List<Post> list = new ArrayList<>();
        //fetch all the post
        try {
        	Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

			con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<Post> getPostByCatId(int catId) {
        List<Post> list = new ArrayList<>();
        try {
        	Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement("select * from posts where catId=?");
            p.setInt(1, catId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");

                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, catId, userId);

                list.add(post);
            }

			con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static Post getPostByPostId(int postId) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
        	Connection con = ConnectionProvider.getConnection();
            PreparedStatement p = con.prepareStatement(q);
            p.setInt(1, postId);

            ResultSet set = p.executeQuery();

            if (set.next()) {

                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                int userId = set.getInt("userId");
                post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

            }

			con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }
    
	public static List<Post> getRecordByKeyword(String keyword) {
		List<Post> posts = new ArrayList<Post>();
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pst = con.prepareStatement("select * from posts where pTitle like '%" + keyword + "%'" + "order by pid desc");
			ResultSet set = pst.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int cid=set.getInt("catId");
                int userId = set.getInt("userId");
                Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

				posts.add(post);
				con.close();
			}				
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return posts;
	}

	public static int delete(int p){
		int status = 0;
		try{
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement ps = con.prepareStatement("delete from posts where pid=?");
			ps.setInt(1,p);
			status = ps.executeUpdate();
		}catch(Exception e){System.out.println(e);}

		return status;
	}
}
