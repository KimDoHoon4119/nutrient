package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String,Object> map = new HashMap<>();
	
   public int maxnum() {
      Connection conn = DBConnection.getConnection();
      String sql = "select ifnull(max(num),0) from board";
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      
      try {
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getInt(1);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return 0;
   } // maxnum
   
   
   public boolean insert(Board board) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      String sql = "insert into board (num, writer, pass, title, content, file1, regdate,"
            + "readcnt, grp, grplevel, grpstep, boardid)" +" values(?,?,?,?,?,?,now(),0,?,?,?,?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, board.getNum());
         pstmt.setString(2, board.getWriter());
         pstmt.setString(3, board.getPass());
         pstmt.setString(4, board.getTitle());
         pstmt.setString(5, board.getContent());
         pstmt.setString(6, board.getFile1());
         pstmt.setInt(7, board.getGrp());
         pstmt.setInt(8, board.getGrplevel());
         pstmt.setInt(9, board.getGrpstep());
         pstmt.setString(10, board.getBoardid());
         
         if(pstmt.executeUpdate() > 0) return true;
         else return false;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   } // insert
   
   
   
   public List<Board> list(String boardid, int pageNum, int limit, String column, String find){
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("boardid",boardid);
			map.put("start",(pageNum-1)*limit);
			map.put("limit",limit);
			map.put("column", column);
			System.out.println(boardid);
			System.out.println((pageNum-1)*limit);
			System.out.println(limit);
			System.out.println(column);
			System.out.println("=====Board Dao=====");
			if(column != null) {
				String[] cols = column.split(",");
						switch(cols.length) {
						case 3 : map.put("col3", cols[2].trim());
						case 2 : map.put("col2", cols[1].trim());
						case 1 : map.put("col1", cols[0].trim());
						}
			map.put("find",find);
			System.out.println("find : "+find);
			}
			return session.getMapper(cls).selectlist(map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			MybatisConnection.close(session);
		}
		return null;
	}
   
   public Board selectOne(int num) {
      Connection conn = DBConnection.getConnection();
      String sql = "select * from board where num=?";
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {   
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, num);
         rs = pstmt.executeQuery(); // 모든 레코드 rs에 저장
         if(rs.next()) {
            Board b = new Board();
            b.setNum(rs.getInt("num"));
            b.setWriter(rs.getString("writer"));
            b.setPass(rs.getString("pass"));
            b.setTitle(rs.getString("title"));
            b.setContent(rs.getString("content"));
            b.setFile1(rs.getString("file1"));
            b.setGrp(rs.getInt("grp"));
            b.setGrplevel(rs.getInt("grplevel"));
            b.setGrpstep(rs.getInt("grpstep"));
            b.setReadcnt(rs.getInt("readcnt"));
            b.setRegdate(rs.getTimestamp("regdate"));
            b.setBoardid(rs.getString("boardid"));
            return b;
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   } // selectOne
   
   public void readcntAdd(int num) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      try {
         pstmt = conn.prepareStatement("update board set readcnt = readcnt+1 where num = ?");
         pstmt.setInt(1, num);
         pstmt.executeUpdate();
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
   } // readcntAdd
   
   public void grpStepAdd(int grp, int grpstep) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      try {
         pstmt = conn.prepareStatement("update board set grpstep = grpstep + 1 where grp=? and grpstep>?");
         pstmt.setInt(1, grp);
         pstmt.setInt(2, grpstep);
         pstmt.executeUpdate();
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
   } // getStepAdd
   
   public boolean update(Board board) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      String sql = "update board set writer=?, title=?, content=?, file1=? where num=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, board.getWriter());
         pstmt.setString(2, board.getTitle());
         pstmt.setString(3, board.getContent());
         pstmt.setString(4, board.getFile1());
         pstmt.setInt(5, board.getNum());
         return pstmt.executeUpdate() > 0;
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      } return false;
   } // update
   
   public int boardCount(String boardid, String column, String find) {
		SqlSession session = MybatisConnection.getConnection();
		try {
			map.clear();
			map.put("boardid",boardid);
			map.put("column", column);
			if(column != null) {
				String[] cols = column.split(",");
						switch(cols.length) {
						case 3 : map.put("col3", cols[2].trim());
						case 2 : map.put("col2", cols[1].trim());
						case 1 : map.put("col1", cols[0].trim());
						}
				map.put("find",find);
			}
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MybatisConnection.close(session);
		}
		return 0;
	}
   
   public boolean delete(int num) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      try {
         pstmt = conn.prepareStatement("delete from board where num=?");
         pstmt.setInt(1, num);
         return pstmt.executeUpdate() > 0;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   } // delete
   
} // class