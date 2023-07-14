package model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

// db관련 함수 모임
public class NutrientDao {
   public Nutrient selectOne(String no) {
      Connection conn = DBConnection.getConnection();
      String sql = "select * from nutrient where no=?";
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, no);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            Nutrient nu = new Nutrient();
            nu.setName(rs.getString("name"));
            nu.setCategory(rs.getString("category"));
            nu.setTview(rs.getInt("tview"));
            nu.setTlike(rs.getInt("tlike"));
            return nu;
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   } // selectOne

   public List<Nutrient> list1(String category) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Nutrient> list1 = new ArrayList<>();
      try {
         pstmt = conn.prepareStatement(
               "SELECT n.no, n.name, n.tview, l.memno,count(l.memno), n.picture "
               + "FROM nutrient n LEFT JOIN likey l ON n.no = l.nutno "
               + "WHERE n.category=? GROUP BY n.no ORDER BY COUNT(l.memno) desc LIMIT 6");
         pstmt.setString(1, category);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            Nutrient nu = new Nutrient();
            nu.setNo(rs.getInt("n.no"));
            nu.setName(rs.getString("n.name"));
            nu.setTview(rs.getInt("n.tview"));
            nu.setTlike(rs.getInt("count(l.memno)"));
            nu.setPicture(rs.getString("n.picture"));
            list1.add(nu);
         }
         return list1;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   }
   
   public List<Nutrient> list2(String eff1) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Nutrient> list2 = new ArrayList<>();
      try {
         pstmt = conn.prepareStatement(
               "SELECT n.no, n.name, n.tview, l.memno,count(l.memno), n.picture "
                     + "FROM nutrient n LEFT JOIN likey l ON n.no = l.nutno "
                     + "WHERE n.eff1=? GROUP BY n.no ORDER BY COUNT(l.memno) desc LIMIT 6");
         pstmt.setString(1, eff1);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            Nutrient nu = new Nutrient();
            nu.setNo(rs.getInt("no"));
            nu.setName(rs.getString("name"));
            nu.setTview(rs.getInt("tview"));
            nu.setTlike(rs.getInt("count(l.memno)"));
            nu.setPicture(rs.getString("picture"));
            list2.add(nu);
         }
         return list2;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   }

   public Nutrient selectDetail(String no) {
         Connection conn = DBConnection.getConnection();
         String sql = "select * from nutrient where no=?";
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               Nutrient nu = new Nutrient();
               nu.setNo(rs.getInt("no"));
               nu.setName(rs.getString("name"));
               nu.setCategory(rs.getString("category"));
               nu.setTview(rs.getInt("tview"));
               nu.setTlike(rs.getInt("tlike"));
               nu.setFacts1(rs.getInt("facts1"));
               nu.setFacts2(rs.getInt("facts2"));
               nu.setFacts3(rs.getInt("facts3"));
               nu.setFacts4(rs.getInt("facts4"));
               nu.setFacts5(rs.getInt("facts5"));
               nu.setFacts6(rs.getInt("facts6"));
               nu.setFacts7(rs.getInt("facts7"));
               nu.setFacts8(rs.getInt("facts8"));
               nu.setFacts9(rs.getInt("facts9"));
               nu.setFacts10(rs.getInt("facts10"));
               nu.setFacts11(rs.getInt("facts11"));
               nu.setFacts12(rs.getInt("facts12"));
               nu.setFacts13(rs.getInt("facts13"));
               nu.setFacts14(rs.getInt("facts14"));
               nu.setFacts15(rs.getInt("facts15"));
               nu.setFacts16(rs.getInt("facts16"));
               nu.setFacts17(rs.getInt("facts17"));
               nu.setFacts18(rs.getInt("facts18"));
               nu.setFacts19(rs.getInt("facts19"));
               nu.setFacts20(rs.getInt("facts20"));
               nu.setFacts21(rs.getInt("facts21"));
               nu.setFacts22(rs.getInt("facts22"));
               nu.setFacts23(rs.getInt("facts23"));
               nu.setFacts24(rs.getInt("facts24"));
               nu.setFacts25(rs.getInt("facts25"));
               nu.setFacts26(rs.getInt("facts26"));
               nu.setFacts27(rs.getInt("facts27"));
               nu.setFacts28(rs.getInt("facts28"));
               nu.setFacts29(rs.getInt("facts29"));
               nu.setFacts30(rs.getInt("facts30"));
               nu.setEff1(rs.getString("eff1"));
               nu.setEff2(rs.getString("eff2"));
               nu.setEff3(rs.getString("eff3"));
               nu.setEff4(rs.getString("eff4"));
               nu.setEff5(rs.getString("eff5"));
               nu.setEtime(rs.getString("etime"));
               nu.setEcount(rs.getInt("ecount"));
               nu.setEtablet(rs.getInt("etablet"));
               nu.setPicture(rs.getString("picture"));
               return nu;
            }
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            DBConnection.close(conn, pstmt, rs);
         }
         return null;
      }

   public List<Nutrient> list3(int pageNum, int limit) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Nutrient> list3 = new ArrayList<Nutrient>();
      try {
         pstmt = conn.prepareStatement("SELECT * from nutrient order by no asc limit ?,?");
         pstmt.setInt(1, (pageNum - 1) * limit);
         pstmt.setInt(2, limit);
         rs = pstmt.executeQuery();
         while (rs.next()) {
            Nutrient nu = new Nutrient();
            nu.setNo(rs.getInt("no"));
            nu.setName(rs.getString("name"));
            nu.setCategory(rs.getString("category"));
            nu.setPicture(rs.getString("picture"));
            list3.add(nu);
         }
         return list3;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, rs);
      }
      return null;
   } // list2

   public boolean nu_delete(String no) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      try {
         pstmt = conn.prepareStatement("delete from nutrient where no=?");
         pstmt.setString(1, no);
         return pstmt.executeUpdate() > 0;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   } // delete()
   
   public boolean insert(Nutrient nu) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      String sql = "insert into nutrient (no, name, category, facts1, facts2, facts3, facts4, facts5,"
            + " facts6, facts7, facts8, facts9, facts10, facts11, facts12, facts13, facts14,"
            + " facts15, facts16, facts17, facts18, facts19, facts20, facts21, facts22, facts23,"
            + " facts24, facts25, facts26, facts27, facts28, facts29, facts30, eff1, eff2, eff3,"
            + " eff4, eff5, picture, etime, ecount, etablet)"
            + " values((SELECT IFNULL(MAX(no) + 1, 1) FROM nutrient n)," + " ?,?,?,?,?,?,?,?,?,?,"
            + " ?,?,?,?,?,?,?,?,?,?," + " ?,?,?,?,?,?,?,?,?,?," + " ?,?,?,?,?,?,?,?,?,?,?)";
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, nu.getName());
         pstmt.setString(2, nu.getCategory());
         pstmt.setInt(3, nu.getFacts1());
         pstmt.setInt(4, nu.getFacts2());
         pstmt.setInt(5, nu.getFacts3());
         pstmt.setInt(6, nu.getFacts4());
         pstmt.setInt(7, nu.getFacts5());
         pstmt.setInt(8, nu.getFacts6());
         pstmt.setInt(9, nu.getFacts7());
         pstmt.setInt(10, nu.getFacts8());
         pstmt.setInt(11, nu.getFacts9());
         pstmt.setInt(12, nu.getFacts10());
         pstmt.setInt(13, nu.getFacts11());
         pstmt.setInt(14, nu.getFacts12());
         pstmt.setInt(15, nu.getFacts13());
         pstmt.setInt(16, nu.getFacts14());
         pstmt.setInt(17, nu.getFacts15());
         pstmt.setInt(18, nu.getFacts16());
         pstmt.setInt(19, nu.getFacts17());
         pstmt.setInt(20, nu.getFacts18());
         pstmt.setInt(21, nu.getFacts19());
         pstmt.setInt(22, nu.getFacts20());
         pstmt.setInt(23, nu.getFacts21());
         pstmt.setInt(24, nu.getFacts22());
         pstmt.setInt(25, nu.getFacts23());
         pstmt.setInt(26, nu.getFacts24());
         pstmt.setInt(27, nu.getFacts25());
         pstmt.setInt(28, nu.getFacts26());
         pstmt.setInt(29, nu.getFacts27());
         pstmt.setInt(30, nu.getFacts28());
         pstmt.setInt(31, nu.getFacts29());
         pstmt.setInt(32, nu.getFacts30());
         pstmt.setString(33, nu.getEff1());
         pstmt.setString(34, nu.getEff2());
         pstmt.setString(35, nu.getEff3());
         pstmt.setString(36, nu.getEff4());
         pstmt.setString(37, nu.getEff5());
         pstmt.setString(38, nu.getPicture());
         pstmt.setString(39, nu.getEtime());
         pstmt.setInt(40, nu.getEcount());
         pstmt.setInt(41, nu.getEtablet());
         if (pstmt.executeUpdate() > 0)
            return true;
         else
            return false;
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   }
   
   public boolean nu_update(Nutrient nu) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      String sql = "update nutrient set name=?, category=?, facts1=?, facts2=?, facts3=?, facts4=?, facts5=?, "
               + " facts6=?, facts7=?, facts8=?, facts9=?, facts10=?, facts11=?, facts12=?, facts13=?, facts14=?, facts15=?,"
               + " facts16=?, facts17=?, facts18=?, facts19=?, facts20=?, facts21=?, facts22=?, facts23=?, facts24=?, facts25=?,"
               + " facts26=?, facts27=?, facts28=?, facts29=?, facts30=?, eff1=?, eff2=?, eff3=?, eff4=?, eff5=?,"
               + " picture=?, etime=?, ecount=?, etablet=? where no=?";   
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, nu.getName());
         pstmt.setString(2, nu.getCategory());
         pstmt.setInt(3, nu.getFacts1());
         pstmt.setInt(4, nu.getFacts2());
         pstmt.setInt(5, nu.getFacts3());
         pstmt.setInt(6, nu.getFacts4());
         pstmt.setInt(7, nu.getFacts5());
         pstmt.setInt(8, nu.getFacts6());
         pstmt.setInt(9, nu.getFacts7());
         pstmt.setInt(10, nu.getFacts8());
         pstmt.setInt(11, nu.getFacts9());
         pstmt.setInt(12, nu.getFacts10());
         pstmt.setInt(13, nu.getFacts11());
         pstmt.setInt(14, nu.getFacts12());
         pstmt.setInt(15, nu.getFacts13());
         pstmt.setInt(16, nu.getFacts14());
         pstmt.setInt(17, nu.getFacts15());
         pstmt.setInt(18, nu.getFacts16());
         pstmt.setInt(19, nu.getFacts17());
         pstmt.setInt(20, nu.getFacts18());
         pstmt.setInt(21, nu.getFacts19());
         pstmt.setInt(22, nu.getFacts20());
         pstmt.setInt(23, nu.getFacts21());
         pstmt.setInt(24, nu.getFacts22());
         pstmt.setInt(25, nu.getFacts23());
         pstmt.setInt(26, nu.getFacts24());
         pstmt.setInt(27, nu.getFacts25());
         pstmt.setInt(28, nu.getFacts26());
         pstmt.setInt(29, nu.getFacts27());
         pstmt.setInt(30, nu.getFacts28());
         pstmt.setInt(31, nu.getFacts29());
         pstmt.setInt(32, nu.getFacts30());
         pstmt.setString(33, nu.getEff1());
         pstmt.setString(34, nu.getEff2());
         pstmt.setString(35, nu.getEff3());
         pstmt.setString(36, nu.getEff4());
         pstmt.setString(37, nu.getEff5());
         pstmt.setString(38, nu.getPicture());
         pstmt.setString(39, nu.getEtime());
         pstmt.setInt(40, nu.getEcount());
         pstmt.setInt(41, nu.getEtablet());
         pstmt.setInt(42, nu.getNo());
         return pstmt.executeUpdate() > 0;
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
      return false;
   } // update 
   
   
   public void readcntAdd(String no) {
      Connection conn = DBConnection.getConnection();
      PreparedStatement pstmt = null;
      try {
         System.out.println(no+"의 조회수 올리는 dao");
         pstmt = conn.prepareStatement("update nutrient set tview = tview+1 where no = ?");
         pstmt.setString(1, no);
         pstmt.executeUpdate();
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         DBConnection.close(conn, pstmt, null);
      }
   } // readcntAdd
   
   public int like(int nutno, int memno) {
         String sql = "INSERT INTO likey(nutno,memno) VALUES (?, ?)";
         Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = null;
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, nutno);
            pstmt.setInt(2, memno);
            if (pstmt.executeUpdate() > 0)
               return 1;
            else
               return 0;
         
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            DBConnection.close(conn, pstmt, null);
         }
         return 0; 
      }
      
      public int like_delete(int nutno, int memno) {
         String sql = "delete from likey where nutno=? AND memno=?";
         Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = null;
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, nutno);
            pstmt.setInt(2, memno);
            if (pstmt.executeUpdate() > 0)
               return 1;
            else
               return 0;
         
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            DBConnection.close(conn, pstmt, null);
         }
         return 0; 
      }
      
      public int likecnt(int nutno) {
         String sql = "select count(*) from likey where nutno=?";
         Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         int lcnt = 0;
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, nutno);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               lcnt =  rs.getInt(1);
            }
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            DBConnection.close(conn, pstmt, null);
         }
         return lcnt; 
      }
      
      public Likey likedup(int nutno, int memno) {
         String sql = "select * from likey where nutno=? AND memno=?";
         Connection conn = DBConnection.getConnection();
         PreparedStatement pstmt = null;
         ResultSet rs = null;
         try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, nutno);
            pstmt.setInt(2, memno);
            rs = pstmt.executeQuery();
            if (rs.next()) {
               Likey likey = new Likey();
               likey.setMemno(rs.getInt("memno"));   
               likey.setNutno(rs.getInt("nutno"));
               return likey;
            }
            
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            DBConnection.close(conn, pstmt, null);
         }
         return null; 
      }
      
      public Nutrient effrec(String eff1) {
          Connection conn = DBConnection.getConnection();
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          try {
             pstmt = conn.prepareStatement(
                   "SELECT n.no, n.category, n.eff1, n.name, n.tview, l.memno,count(l.memno), "
                   + "n.picture FROM nutrient n LEFT JOIN likey l ON n.no = l.nutno "
                   + "WHERE n.eff1 = ? GROUP BY n.no ORDER BY count(l.memno) DESC LIMIT 1");
             pstmt.setString(1, eff1);
             rs = pstmt.executeQuery();
             while (rs.next()) {
                Nutrient nu = new Nutrient();
                nu.setNo(rs.getInt("no"));
                nu.setName(rs.getString("name"));
                nu.setTview(rs.getInt("tview"));
                nu.setCategory(rs.getString("category"));
                nu.setEff1(rs.getString("eff1"));
                nu.setTlike(rs.getInt("count(l.memno)"));
                nu.setPicture(rs.getString("picture"));
                return nu;
             }
          } catch (SQLException e) {
             e.printStackTrace();
          } finally {
             DBConnection.close(conn, pstmt, rs);
          }
          return null;
       }
      
      public Nutrient caterec(String cate) {
          Connection conn = DBConnection.getConnection();
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          try {
             pstmt = conn.prepareStatement(
                   "SELECT n.no, n.category, n.name, n.tview, l.memno,count(l.memno), "
                   + "n.picture FROM nutrient n LEFT JOIN likey l ON n.no = l.nutno "
                   + "WHERE n.category = ? GROUP BY n.no ORDER BY count(l.memno) DESC LIMIT 1");
             pstmt.setString(1, cate);
             rs = pstmt.executeQuery();
             while (rs.next()) {
                Nutrient nu = new Nutrient();
                nu.setNo(rs.getInt("no"));
                nu.setName(rs.getString("name"));
                nu.setTview(rs.getInt("tview"));
                nu.setCategory(rs.getString("category"));
                nu.setTlike(rs.getInt("count(l.memno)"));
                nu.setPicture(rs.getString("picture"));
                return nu;
             }
          } catch (SQLException e) {
             e.printStackTrace();
          } finally {
             DBConnection.close(conn, pstmt, rs);
          }
          return null;
       }
      
      
      public int nu_boardCount() {
          Connection conn = DBConnection.getConnection();
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          try {
             pstmt = conn.prepareStatement("select count(*) from nutrient");
             rs = pstmt.executeQuery();
             if (rs.next()) return rs.getInt(1);
          } catch (SQLException e) {
             e.printStackTrace();
          } finally {
             DBConnection.close(conn, pstmt, rs);
          }
          return 0;
       } // boardCount
      
      public int nu_boardCount(String column, String find) {
          Connection conn = DBConnection.getConnection();
          PreparedStatement pstmt = null;
          ResultSet rs = null;
          try {
             pstmt = conn.prepareStatement("SELECT count(*) "
                     + "FROM nutrient WHERE "+column+" LIKE ?");
             pstmt.setString(1, "%"+find+"%");
             rs = pstmt.executeQuery();
             if (rs.next()) return rs.getInt(1);
          } catch (SQLException e) {
             e.printStackTrace();
          } finally {
             DBConnection.close(conn, pstmt, rs);
          }
          return 0;
       } // boardCount
      
   public List<Nutrient> allnut(String column, String find, String orderby, int pageNum, int limit) {
      Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        try {
           pstmt = conn.prepareStatement("SELECT n.no, n.category, n.eff1, n.name, n.tview, count(l.memno) likecnt,n.picture "
                   + "FROM nutrient n LEFT JOIN likey l ON n.no = l.nutno "
                   + "WHERE "+column+" LIKE ? GROUP BY n.no ORDER BY "+orderby+" LIMIT ?,?");
           pstmt.setString(1, "%"+find+"%");
           pstmt.setInt(2, (pageNum - 1) * limit);
           pstmt.setInt(3, limit);
           rs = pstmt.executeQuery();
           List<Nutrient> allnutlist = new ArrayList<>();
           while (rs.next()) {
              Nutrient nu = new Nutrient();
              
              nu.setNo(rs.getInt("no"));
              nu.setName(rs.getString("name"));
              nu.setTview(rs.getInt("tview"));
              nu.setCategory(rs.getString("category"));
              nu.setTlike(rs.getInt("likecnt"));
              nu.setPicture(rs.getString("n.picture"));
              allnutlist.add(nu);
           }
           return allnutlist;
        } catch (SQLException e) {
           e.printStackTrace();
        } finally {
           DBConnection.close(conn, pstmt, rs);
        }
        return null;
   }
      
} // class Member Dao