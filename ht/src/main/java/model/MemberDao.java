package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

// db관련 함수 모임
public class MemberDao {
   public boolean insert(Member mem) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      String sql = "insert into member (name, id, pass, gender, tel, email, weight, height, beat) "
                 + " values(?,?,?,?,?,?,?,?,?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mem.getName());
         pstmt.setString(2, mem.getId());
         pstmt.setString(3, mem.getPass());
         pstmt.setInt(4, mem.getGender());
         pstmt.setString(5, mem.getTel());
         pstmt.setString(6, mem.getEmail());
         pstmt.setString(7, mem.getWeight());
         pstmt.setString(8, mem.getHeight());
         pstmt.setString(9, mem.getBeat());
         if(pstmt.executeUpdate() > 0) return true;
         else return false;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
      
   }
   
   public Member selectOne(String id) {
      Connection conn = DBConnection.getConnection();
      String sql = "select * from member where id=?";
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {   
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, id);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            Member mem = new Member();
            mem.setNo(rs.getInt("no"));
            mem.setName(rs.getString("name"));
            mem.setId(rs.getString("id"));
            mem.setPass(rs.getString("pass"));
            mem.setGender(rs.getInt("gender"));
            mem.setTel(rs.getString("tel"));
            mem.setEmail(rs.getString("email"));
            mem.setWeight(rs.getString("weight"));
            mem.setHeight(rs.getString("height"));
            mem.setBeat(rs.getString("beat"));
            return mem;
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   } // selectOne
   
   public String idSearch(String email, String tel) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         pstmt = conn.prepareStatement("select id from member where email=? and tel=?");
         pstmt.setString(1, email);
         pstmt.setString(2, tel);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getString("id");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }return null;
   }
   
   public String pwSearch(String id, String email, String tel) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         pstmt = conn.prepareStatement("select pass from member where id=? and email=? and tel=?");
         pstmt.setString(1, id);
         pstmt.setString(2, email);
         pstmt.setString(3, tel);
         rs = pstmt.executeQuery();
         if(rs.next()) {
            return rs.getString("pass");
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }return null;
   }
   
   public boolean update(Member mem) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      String sql = "update member set name=?, gender=?, tel=?, email=?,"
            +"weight=?, height=?, beat=? where id=?";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, mem.getName());
         pstmt.setInt(2, mem.getGender());
         pstmt.setString(3, mem.getTel());
         pstmt.setString(4, mem.getEmail());
         pstmt.setString(5, mem.getWeight());
         pstmt.setString(6, mem.getHeight());
         pstmt.setString(7, mem.getBeat());
         pstmt.setString(8, mem.getId());
         return pstmt.executeUpdate() > 0;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   }
      
       //중복검사 시작
      public int mynutdup(int memno, int no) {
         Connection conn = DBConnection.getConnection();
         String sql = "select * from mynut where memno=? AND nutno=?";
         PreparedStatement pstmt = null;
         ResultSet rs = null;
           try {
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, memno);
              pstmt.setInt(2, no);
              rs = pstmt.executeQuery();
              if(rs.next()) {
                     return 1;
              }else {
                 return 0;
              }
           }catch (SQLException e) {
              e.printStackTrace();
           } finally {
              DBConnection.close(conn, pstmt, null);
           }
           return 0;
        }
        
       
   public boolean mynutadd(int memno, int no) {
         Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = null;
         String sql = "INSERT INTO mynut (mynutno,memno,nutno) VALUES((SELECT IFNULL(MAX(mynutno) + 1, 1) FROM mynut n),?,?)";
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, memno);
            pstmt.setInt(2, no);
            return pstmt.executeUpdate() > 0;
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBConnection.close(conn, pstmt, null);
         }
         return false;
      }
   
   public boolean mynutdelete(int memno, int no) {
       Connection conn = DBConnection.getConnection();
       PreparedStatement pstmt = null;
       String sql = "delete from mynut where memno=? and nutno=?";
       try {
          pstmt = conn.prepareStatement(sql);
          pstmt.setInt(1, memno);
          pstmt.setInt(2, no);
          return pstmt.executeUpdate() > 0;
       } catch (SQLException e) {
          e.printStackTrace();
       } finally {
          DBConnection.close(conn, pstmt, null);
       }
       return false;
    }
   
   public List<Nutrient> mynutlist(int memno) {
       String sql = "SELECT no,NAME,tview,tlike,picture,COUNT(l.memno) FROM nutrient n LEFT JOIN likey l ON n.no = l.nutno where no in (SELECT nutno FROM mynut n WHERE memno=?) GROUP BY n.no ORDER BY COUNT(l.memno)";
       Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Nutrient> mynutlist = new ArrayList<>();
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, memno);
            rs = pstmt.executeQuery();
            while(rs.next()) {
               Nutrient nu = new Nutrient();
            nu.setNo(rs.getInt("no"));
            nu.setName(rs.getString("name"));
            nu.setTview(rs.getInt("tview"));
            nu.setTlike(rs.getInt("COUNT(l.memno)"));
            nu.setPicture(rs.getString("picture"));
            mynutlist.add(nu);
            }
            return mynutlist;
         }catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBConnection.close(conn, pstmt, null);
         }
         return null;
      }
   
   public boolean delete(String id) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      try {
         pstmt = conn.prepareStatement("delete from member where id=?");
         pstmt.setString(1, id);
         return pstmt.executeUpdate() > 0;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   } // delete()
   
   public List<Member> list() {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Member> list = new ArrayList<>();
      try {
         pstmt = conn.prepareStatement("select * from member");
         rs = pstmt.executeQuery();
         while(rs.next()) {
            Member m = new Member();
            m.setId(rs.getString("id"));
            m.setPass(rs.getString("pass"));
            m.setName(rs.getString("name"));
            m.setGender(rs.getInt("gender"));
            m.setTel(rs.getString("tel"));
            m.setEmail(rs.getString("email"));
            list.add(m);
         }
         return list;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   } // list
   
   public int mem_memberCount() {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         pstmt = conn.prepareStatement("select count(*) from member");
         rs = pstmt.executeQuery();
         if (rs.next()) return rs.getInt(1);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return 0;
   } // boardCount
   
} // class Member Dao