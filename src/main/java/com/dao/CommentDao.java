package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.bean.Comment;
import com.dao.bean.LeafComment;
import com.helper.ConnectionProvider;

public class CommentDao {
	public static List<Comment> fetchComments(int postId){
		List<Comment> ls = new ArrayList<Comment>();
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pst = con.prepareStatement("select * from comments where pid = ? order by cid desc");
			pst.setInt(1, postId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				c.setId(rs.getInt("cid"));
				c.setCommentText(rs.getString("content"));
				c.setUser(UserDao.getUserByUserId(rs.getInt("uid")));
				List<LeafComment> rep = new ArrayList<LeafComment>();
				PreparedStatement npst = con.prepareStatement("select * from reply where cid = ? order by rid desc");
				npst.setInt(1, c.getId());
				ResultSet nrs = npst.executeQuery();
				while(nrs.next()) {
					LeafComment l = new LeafComment();
					l.setCommentText(nrs.getString("content"));
					l.setUser(UserDao.getUserByUserId(nrs.getInt("uid")));
					l.setId(nrs.getInt("rid"));
					rep.add(l);
				}
				c.setReplies(rep);
				ls.add(c);
			}
			con.close();
			return ls;
		}catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	public static int add(Comment c) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into comments(uid, pid, content) values(?, ?, ?)");
            pst.setInt(1, c.getUser().getId());
            pst.setInt(2, c.getPid());
            pst.setString(3, c.getCommentText());
            status = pst.executeUpdate();
			con.close();
            return status;
        } catch (Exception e) {
        	System.out.println(e);
        }
		return status;
	}
	public static int delete(Comment c) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pst = con.prepareStatement("delete from comments where cid = ?");
			pst.setInt(1, c.getId());
			status = pst.executeUpdate();
			con.close();
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	public static int update(Comment c) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
			PreparedStatement pst = con.prepareStatement("update comments set content = ? where cid =?");
			pst.setString(1, c.getCommentText());
			pst.setInt(2, c.getId());
			status = pst.executeUpdate();
			con.close();
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	
	public static int addReply(LeafComment r) {
		int status = 0;
		try {
			Connection con = ConnectionProvider.getConnection();
            PreparedStatement pst = con.prepareStatement("insert into reply(cid, uid, content) values(?, ?, ?)");
            pst.setInt(1, r.getCid());
            pst.setInt(2, r.getUser().getId());
            pst.setString(3, r.getCommentText());
            status = pst.executeUpdate();
			con.close();
            return status;
        } catch (Exception e) {
        	System.out.println(e);
        }
		return status;
	}
}
