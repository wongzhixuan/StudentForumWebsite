package com.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.dao.bean.Record;
import com.dao.bean.User;
import com.helper.ConnectionProvider;
public class RecordDao {
	private static Connection con = ConnectionProvider.getConnection();
	//TODO delete
	public static List<Record> getAllRecords(){
		List<Record> list = new ArrayList<Record>();
				
		try {
			PreparedStatement pst = con.prepareStatement("select * from post order by postId desc");
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Record r = new Record();
				r.setId(rs.getInt("postId"));
				r.setTitle(rs.getString("title"));
				r.setDescrip(rs.getString("description"));
				list.add(r);
			}
			
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return list;
	}
	
	public static List<Record> getRecordByKeyword(String keyword) {
		List<Record> record = new ArrayList<Record>();
		try {
			PreparedStatement pst = con.prepareStatement("select * from post where title like '%" + keyword + "%'" + "order by postId desc");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Record r = new Record();
				r.setId(rs.getInt("postId"));
				r.setTitle(rs.getString("title"));
				record.add(r);
			}				
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return record;
	}
	
	public static List<Record> getRecordById(int postId) {
		List<Record> record = new ArrayList<Record>();
		try {
			PreparedStatement pst = con.prepareStatement("select * from post where postId=?");
			pst.setInt(1, postId);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				Record r = new Record();
				r.setId(rs.getInt("postId"));
				r.setTitle(rs.getString("title"));
				r.setDescrip(rs.getString("description"));
				record.add(r);
			}	
						
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return record;
	}
	public static int delete(Record r) {
		int status = 0;
		try {
			PreparedStatement pst = con.prepareStatement("delete from post where postId=?");
			pst.setInt(1, r.getId());
			status = pst.executeUpdate();
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return status;
	}
	public static List<Record> getRecordByCategory(String category){
		List<Record> record = new ArrayList<Record>();
		try {
			PreparedStatement pst = con.prepareStatement("select * from post where category =? order by postId desc");
			ResultSet rs = pst.executeQuery();
			
			while(rs.next()) {
				Record r = new Record();
				r.setId(rs.getInt("postId"));
				r.setTitle(rs.getString("title"));
				record.add(r);
			}				
		}catch(Exception ex) {
			System.out.println(ex);
		}
		return record;
		
	}

}

