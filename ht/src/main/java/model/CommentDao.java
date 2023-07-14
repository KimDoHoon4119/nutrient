package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
	public List<Comment> list(int num){
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Comment> list = new ArrayList<Comment>();
		//limit 시작레코드번호,갯수
		String sql = "select * from comment where num = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Comment c = new Comment();
				c.setNum(rs.getInt("num"));
				c.setSeq(rs.getInt("seq"));
				c.setWriter(rs.getString("writer"));
				c.setContent(rs.getString("content"));
				c.setRegdate(rs.getDate("regdate"));
				list.add(c);
			}
			return list;
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	
	
	
	public int maxseq(int num) {
		Connection conn = DBConnection.getConnection();
		String sql = "select ifnull(max(seq),0) from comment where num=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return 0;
	}
	
	
	
	public boolean insert(Comment comm) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into comment"
			+ " (num, seq,writer,content,regdate)"
			+ " values (?,?,?,?,now())";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comm.getNum());
			pstmt.setInt(2, comm.getSeq());
			pstmt.setString(3, comm.getWriter());
			pstmt.setString(4, comm.getContent());
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn, pstmt, null);
		}
		return false;
	}
	
	public boolean delete(int num, int seq) {
		Connection conn = DBConnection.getConnection();
	    PreparedStatement pstmt = null;
	    try {
			pstmt = conn.prepareStatement("delete from comment where num=? and seq=?");
			pstmt.setInt(1,num);
			pstmt.setInt(2,seq);
			return pstmt.executeUpdate() > 0;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(conn,pstmt,null);
		}return false;
	}
	
}
