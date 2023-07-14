package controller;

import java.awt.Window;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.DBConnection;
import model.Member;
import model.MemberDao;
import model.Nutrient;
import model.NutrientDao;

// /member/* : http://localhost:8080/jspstudy2/member/ 이후의 어떤 요청이 들어와도 MemberController 서블릿이 호출됨

@WebServlet(urlPatterns= {"/nutrients/*"},initParams= {@WebInitParam(name="view",value="/view/")})
public class nutrientsController extends MskimRequestMapping{ // MskimRequestMapping : Servlet 파일
   private NutrientDao dao = new NutrientDao();
   @RequestMapping("main")
   public String main(HttpServletRequest request,HttpServletResponse response) {
      return "nutrients/main";
   } // main
   
   @RequestMapping("info1")
   public String info1(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      request.getSession().setAttribute("category",request.getParameter("cate"));
      String category = (String)request.getSession().getAttribute("category");
      String tview = request.getParameter("tview");
      String no = request.getParameter("no");
       //   int nutno = Integer.parseInt(no);
       //   request.setAttribute("likecnt", dao.likecnt(nutno));
      if(tview==null || !tview.equals("f")) dao.readcntAdd(no);
      
      List<Nutrient> list1 = dao.list1(category);
      request.setAttribute("list1", list1);
      
      return "nutrients/info1";
   } // info1
   
   @RequestMapping("info2")
   public String info2(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      request.getSession().setAttribute("eff1",request.getParameter("eff"));
      String eff1 = (String)request.getSession().getAttribute("eff1");
      
      List<Nutrient> list2 = dao.list2(eff1);
      //String no = request.getParameter("n.no");
       //int nutno = Integer.parseInt(no);
       //request.setAttribute("likecnt", dao.likecnt(nutno));
      request.setAttribute("list2", list2);
      
      return "nutrients/info2";
   } // info1
   
   
   @RequestMapping("infoDetail")
    public String infoDetail(HttpServletRequest request,HttpServletResponse response) {
       try {
          request.setCharacterEncoding("UTF-8");
       } catch (UnsupportedEncodingException e) {
          e.printStackTrace();
       }
       String tview = request.getParameter("tview");
       MemberDao mdao = new MemberDao();
       String login = (String)request.getSession().getAttribute("login");
       Member dbMem = mdao.selectOne(login);
       String no = request.getParameter("no");
       int nutno = Integer.parseInt(no);
       request.setAttribute("likecnt", dao.likecnt(nutno));
       if(tview==null || !tview.equals("f")) dao.readcntAdd(no);
       Nutrient nu = dao.selectDetail(no);
       request.setAttribute("nu", nu);
       return "nutrients/infoDetail";
    } // infoDetail
   
   @RequestMapping("nu_list")
   public String nu_list(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      request.getSession().setAttribute("pageNum", "1");
      int pageNum = 1;
      try {
         pageNum = Integer.parseInt(request.getParameter("pageNum"));
      } catch (NumberFormatException e) {}
      
      int limit = 20;
      int boardcount = dao.nu_boardCount(); // 21
      
      int maxpage = (int)((double)boardcount/limit + 0.95);
      int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
      int endpage = startpage + 9;
      if(endpage > maxpage) endpage = maxpage;
      
      String login = (String)request.getSession().getAttribute("login");
      if (login == null) {
           request.setAttribute("msg", "관리자만 접속 가능 합니다.");
           request.setAttribute("url", "main");
           return "alert";
      } else if (login.equals(null)) {
           request.setAttribute("msg", "관리자만 접속 가능 합니다.");
           request.setAttribute("url", "main");
           return "alert";
      }
      List<Nutrient> list3 = dao.list3(pageNum, limit);
      int boardnum = 1 + (pageNum-1) * limit; // 1
      request.setAttribute("boardcount", boardcount); // no db
      request.setAttribute("pageNum", pageNum); // no db
      request.setAttribute("boardnum", boardnum); // no db
      request.setAttribute("startpage", startpage); // no db
      request.setAttribute("endpage", endpage); // no db
      request.setAttribute("maxpage", maxpage); // no db
      request.setAttribute("list3", list3);
      return "nutrients/nu_list";
   } // nu_list
   
   @RequestMapping("nu_deleteForm")
   public String nu_deleteForm(HttpServletRequest request,HttpServletResponse response) {
      return "nutrients/nu_deleteForm";
   } // updateForm
   
   @RequestMapping("nu_delete")
   public String nu_delete(HttpServletRequest request,HttpServletResponse response) {
       String no = request.getParameter("no");
      String pass = request.getParameter("pass");
      String login = (String)request.getSession().getAttribute("login");
      String msg = null;
       String url = null;
       
       if (login == null) {
           request.setAttribute("msg", "관리자만 삭제 가능 합니다.");
           request.setAttribute("url", "main");
           return "alert";
      } else if (login.equals(null)) {
           request.setAttribute("msg", "관리자만 삭제 가능 합니다.");
           request.setAttribute("url", "main");
           return "alert";
      } 
       
       MemberDao mdao = new MemberDao();
       Member dbMem = mdao.selectOne(login);
       if(!pass.equals(dbMem.getPass())) {
           request.setAttribute("msg", "비밀번호 오류"); 
            request.setAttribute("url", "nu_deleteForm?no="+no);
            return  "alert";
       }
       
      if(dao.nu_delete(no)) {
         msg=no+" 번 영양제 삭제 성공";
         url="nu_list";
      } else {
         msg=no+" 번 삭제 실패, 오류 발생";
         url="nu_deleteForm?no="+no;
      }
       request.setAttribute("msg", msg);
       request.setAttribute("url", url);
        
        return "alert";
   } // nu_delete
   
   @RequestMapping("nu_picture")
   public String nu_picture(HttpServletRequest request,HttpServletResponse response) {
      /*
       * 1. 이미지파일 업로드. request 객체 사용 불가
                이미지파일 업로드의 위치 : 현재 URL/picture 폴더로 설정
           2. opener 화면에 결과 전달 =>javascript
            3. 현재 화면 close() =>javascript
       */
	   //<img src="/ht/picture/${n.picture}" width="100"
		 //        <img src="../image/${n.picture}" width="100"
      String path = request.getServletContext().getRealPath("/") + "image/"; // this.getServletContext() : application
      String fname = null;
      File f = new File(path);
      if(!f.exists()) {   f.mkdirs();   }  //업로드 폴더가 없는 경우 폴더 생성
      MultipartRequest multi = null;
      try {
         multi = new MultipartRequest(request,path,10*1024*1024,"utf-8");
      } catch (IOException e) {
         e.printStackTrace();
      }
      fname = multi.getFilesystemName("picture");
      request.setAttribute("fname", fname);
      return "nutrients/nu_picture";
   } // nu_picture
   
   @RequestMapping("nu_write")
   public String nu_write(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      Nutrient nu = new Nutrient();
      nu.setName(request.getParameter("name"));
      nu.setCategory(request.getParameter("category"));
      if(request.getParameter("facts1") != "") nu.setFacts1(Integer.parseInt(request.getParameter("facts1"))); 
      if(request.getParameter("facts2") != "") nu.setFacts2(Integer.parseInt(request.getParameter("facts2")));
      if(request.getParameter("facts3") != "") nu.setFacts3(Integer.parseInt(request.getParameter("facts3")));
      if(request.getParameter("facts4") != "") nu.setFacts4(Integer.parseInt(request.getParameter("facts4")));
      if(request.getParameter("facts5") != "") nu.setFacts5(Integer.parseInt(request.getParameter("facts5")));
      if(request.getParameter("facts6") != "") nu.setFacts6(Integer.parseInt(request.getParameter("facts6")));
      if(request.getParameter("facts7") != "") nu.setFacts7(Integer.parseInt(request.getParameter("facts7")));
      if(request.getParameter("facts8") != "") nu.setFacts8(Integer.parseInt(request.getParameter("facts8")));
      if(request.getParameter("facts9") != "") nu.setFacts9(Integer.parseInt(request.getParameter("facts9")));
      if(request.getParameter("facts10") != "") nu.setFacts10(Integer.parseInt(request.getParameter("facts10")));
      if(request.getParameter("facts11") != "") nu.setFacts11(Integer.parseInt(request.getParameter("facts11")));
      if(request.getParameter("facts12") != "") nu.setFacts12(Integer.parseInt(request.getParameter("facts12")));
      if(request.getParameter("facts13") != "") nu.setFacts13(Integer.parseInt(request.getParameter("facts13")));
      if(request.getParameter("facts14") != "") nu.setFacts14(Integer.parseInt(request.getParameter("facts14")));
      if(request.getParameter("facts15") != "") nu.setFacts15(Integer.parseInt(request.getParameter("facts15")));
      if(request.getParameter("facts16") != "") nu.setFacts16(Integer.parseInt(request.getParameter("facts16")));
      if(request.getParameter("facts17") != "") nu.setFacts17(Integer.parseInt(request.getParameter("facts17")));
      if(request.getParameter("facts18") != "") nu.setFacts18(Integer.parseInt(request.getParameter("facts18")));
      if(request.getParameter("facts19") != "") nu.setFacts19(Integer.parseInt(request.getParameter("facts19")));
      if(request.getParameter("facts20") != "") nu.setFacts20(Integer.parseInt(request.getParameter("facts20")));
      if(request.getParameter("facts21") != "") nu.setFacts21(Integer.parseInt(request.getParameter("facts21")));
      if(request.getParameter("facts22") != "") nu.setFacts22(Integer.parseInt(request.getParameter("facts22")));
      if(request.getParameter("facts23") != "") nu.setFacts23(Integer.parseInt(request.getParameter("facts23")));
      if(request.getParameter("facts24") != "") nu.setFacts24(Integer.parseInt(request.getParameter("facts24")));
      if(request.getParameter("facts25") != "") nu.setFacts25(Integer.parseInt(request.getParameter("facts25")));
      if(request.getParameter("facts26") != "") nu.setFacts26(Integer.parseInt(request.getParameter("facts26")));
      if(request.getParameter("facts27") != "") nu.setFacts27(Integer.parseInt(request.getParameter("facts27")));
      if(request.getParameter("facts28") != "") nu.setFacts28(Integer.parseInt(request.getParameter("facts28")));
      if(request.getParameter("facts29") != "") nu.setFacts29(Integer.parseInt(request.getParameter("facts29")));
      if(request.getParameter("facts30") != "") nu.setFacts30(Integer.parseInt(request.getParameter("facts30")));
      if(request.getParameter("eff1") != "") nu.setEff1(request.getParameter("eff1"));
      if(request.getParameter("eff2") != "") nu.setEff2(request.getParameter("eff2"));
      if(request.getParameter("eff3") != "") nu.setEff3(request.getParameter("eff3"));
      if(request.getParameter("eff4") != "") nu.setEff4(request.getParameter("eff4"));
      if(request.getParameter("eff5") != "") nu.setEff5(request.getParameter("eff5"));
      if(request.getParameter("etime") != "") nu.setEtime(request.getParameter("etime"));
      if(request.getParameter("ecount") != "") nu.setEcount(Integer.parseInt(request.getParameter("ecount")));
      if(request.getParameter("etablet") != "") nu.setEtablet(Integer.parseInt(request.getParameter("etablet")));
      if(request.getParameter("picture") != "") nu.setPicture(request.getParameter("picture"));
      
      if(dao.insert(nu)){
          request.setAttribute("msg", nu.getName()+" 등록 완료 되었습니다.");
          request.setAttribute("url", "nu_list");
       } else {
          request.setAttribute("msg", "오류 발생");
          request.setAttribute("url", "nutrient/nu_writeForm");
       }
      return "alert";
   } // nu_write
   
   @RequestMapping("nu_updateForm")
   public String nu_updateForm(HttpServletRequest request,HttpServletResponse response) {
      String no = request.getParameter("no");
      Nutrient nu = dao.selectDetail(no);
      request.setAttribute("nu", nu);
      return "nutrients/nu_updateForm";
   } // updateForm
   
   @RequestMapping("nu_update")
   public String nu_update(HttpServletRequest request,HttpServletResponse response) {
      // 1. 모든 파라미터를 Member 객체에 저장하기
      // 2. 입력된 비밀번호와 db에 저장된 비밀번호를 비교.
      //      - 관리자인 경우 관리자 비밀번호로 비교
      //      - 불일치 : '비밀번호 오류' 메세지 출력 후 updateForm.jsp 페이지 이동
      // 3. Member 객체의 내용으로 db를 수정
      //      - 성공 : '회원정보 수정 완료' 메세지 출력 후 info.jsp 페이지로 이동
      //      - 실패 : '회원정보 수정 실패' 메세지 출력 후 updateForm.jsp 페이지로 이동
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      String no = request.getParameter("no");
      
      Nutrient nu = new Nutrient();
      nu.setNo(Integer.parseInt(request.getParameter("no")));
      nu.setName(request.getParameter("name"));
      nu.setCategory(request.getParameter("category"));
      if(request.getParameter("facts1") != "") nu.setFacts1(Integer.parseInt(request.getParameter("facts1"))); 
      if(request.getParameter("facts2") != "") nu.setFacts2(Integer.parseInt(request.getParameter("facts2")));
      if(request.getParameter("facts3") != "") nu.setFacts3(Integer.parseInt(request.getParameter("facts3")));
      if(request.getParameter("facts4") != "") nu.setFacts4(Integer.parseInt(request.getParameter("facts4")));
      if(request.getParameter("facts5") != "") nu.setFacts5(Integer.parseInt(request.getParameter("facts5")));
      if(request.getParameter("facts6") != "") nu.setFacts6(Integer.parseInt(request.getParameter("facts6")));
      if(request.getParameter("facts7") != "") nu.setFacts7(Integer.parseInt(request.getParameter("facts7")));
      if(request.getParameter("facts8") != "") nu.setFacts8(Integer.parseInt(request.getParameter("facts8")));
      if(request.getParameter("facts9") != "") nu.setFacts9(Integer.parseInt(request.getParameter("facts9")));
      if(request.getParameter("facts10") != "") nu.setFacts10(Integer.parseInt(request.getParameter("facts10")));
      if(request.getParameter("facts11") != "") nu.setFacts11(Integer.parseInt(request.getParameter("facts11")));
      if(request.getParameter("facts12") != "") nu.setFacts12(Integer.parseInt(request.getParameter("facts12")));
      if(request.getParameter("facts13") != "") nu.setFacts13(Integer.parseInt(request.getParameter("facts13")));
      if(request.getParameter("facts14") != "") nu.setFacts14(Integer.parseInt(request.getParameter("facts14")));
      if(request.getParameter("facts15") != "") nu.setFacts15(Integer.parseInt(request.getParameter("facts15")));
      if(request.getParameter("facts16") != "") nu.setFacts16(Integer.parseInt(request.getParameter("facts16")));
      if(request.getParameter("facts17") != "") nu.setFacts17(Integer.parseInt(request.getParameter("facts17")));
      if(request.getParameter("facts18") != "") nu.setFacts18(Integer.parseInt(request.getParameter("facts18")));
      if(request.getParameter("facts19") != "") nu.setFacts19(Integer.parseInt(request.getParameter("facts19")));
      if(request.getParameter("facts20") != "") nu.setFacts20(Integer.parseInt(request.getParameter("facts20")));
      if(request.getParameter("facts21") != "") nu.setFacts21(Integer.parseInt(request.getParameter("facts21")));
      if(request.getParameter("facts22") != "") nu.setFacts22(Integer.parseInt(request.getParameter("facts22")));
      if(request.getParameter("facts23") != "") nu.setFacts23(Integer.parseInt(request.getParameter("facts23")));
      if(request.getParameter("facts24") != "") nu.setFacts24(Integer.parseInt(request.getParameter("facts24")));
      if(request.getParameter("facts25") != "") nu.setFacts25(Integer.parseInt(request.getParameter("facts25")));
      if(request.getParameter("facts26") != "") nu.setFacts26(Integer.parseInt(request.getParameter("facts26")));
      if(request.getParameter("facts27") != "") nu.setFacts27(Integer.parseInt(request.getParameter("facts27")));
      if(request.getParameter("facts28") != "") nu.setFacts28(Integer.parseInt(request.getParameter("facts28")));
      if(request.getParameter("facts29") != "") nu.setFacts29(Integer.parseInt(request.getParameter("facts29")));
      if(request.getParameter("facts30") != "") nu.setFacts30(Integer.parseInt(request.getParameter("facts30")));
      if(request.getParameter("eff1") != "") nu.setEff1(request.getParameter("eff1"));
      if(request.getParameter("eff2") != "") nu.setEff2(request.getParameter("eff2"));
      if(request.getParameter("eff3") != "") nu.setEff3(request.getParameter("eff3"));
      if(request.getParameter("eff4") != "") nu.setEff4(request.getParameter("eff4"));
      if(request.getParameter("eff5") != "") nu.setEff5(request.getParameter("eff5"));
      if(request.getParameter("etime") != "") nu.setEtime(request.getParameter("etime"));
      if(request.getParameter("ecount") != "") nu.setEcount(Integer.parseInt(request.getParameter("ecount")));
      if(request.getParameter("etablet") != "") nu.setEtablet(Integer.parseInt(request.getParameter("etablet")));
      if(request.getParameter("picture") != "") nu.setPicture(request.getParameter("picture"));
       
      if(dao.nu_update(nu)){
          request.setAttribute("msg", nu.getName()+" 수정 완료 되었습니다.");
          request.setAttribute("url", "nu_list");
       } else {
          request.setAttribute("msg", "오류 발생");
          request.setAttribute("url", "nu_updateForm?no="+no);
       }
      return "alert";
   } // nu_update
   
   @RequestMapping("nu_recForm")
   public String nu_recForm(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      String name = request.getParameter("name");
      String height = request.getParameter("height");
      
      if (name != null) {
         request.setAttribute("pageNum", 1);
         return "nutrients/nu_recForm";
      }
      
      if (height != null) {
         request.setAttribute("pageNum", 2);
         return "nutrients/nu_recForm";
      }
      
      return "nutrients/nu_recForm";
   } // nu_list
   
   @RequestMapping("likey")
      public String likey(HttpServletRequest request,HttpServletResponse response) {
         try {
            request.setCharacterEncoding("UTF-8");
         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         }
         String login = (String)request.getSession().getAttribute("login");
         if (login == null) {
              request.setAttribute("msg", "로그인 하셔야 추천기능을 사용할수있습니다.");
              request.setAttribute("url", "../member/loginForm");
              return "alert";
         } else if (login != null) {
               MemberDao mdao = new MemberDao();
               Member dbMem = mdao.selectOne(login);
               int memno = dbMem.getNo();
               int nutno = Integer.parseInt(request.getParameter("nu_no"));
               int likedup = 0;
                  try {
                      likedup = dao.likedup(nutno, memno).getMemno();
                  } catch (Exception e) {} 
                  
               if(likedup != 0) {
                  dao.like_delete(nutno, memno);
                  //request.setAttribute("likecnt", dao.likecnt(nutno, memno));
                  request.setAttribute("msg", "좋아요 취소합니다.");
                  request.setAttribute("url", "infoDetail?no="+nutno);
                  return "alert";
                  //return "nutrients/infoDetail?no="+nutno;
               }else if(likedup == 0){
                  dao.like(nutno, memno);
                  request.setAttribute("msg", "좋아요!");
                  request.setAttribute("url", "infoDetail?no="+nutno);
                  //return "nutrients/infoDetail?no="+nutno;
                  return "alert";
               }
         }
         return "";
      }
   @RequestMapping("nu_rec")
   public String nu_rec(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      
      String name = request.getParameter("name");
      String height = request.getParameter("height");
      String weight = request.getParameter("weight");
      String beat = request.getParameter("beat");
      
      int bmi_weight = Integer.parseInt(weight);
      int bmi_height = Integer.parseInt(height);
      DecimalFormat df = new DecimalFormat("0.00");
      String bmi_result = df.format((float)bmi_weight / ((float)(bmi_height * bmi_height) /10000));
      String bmi_result_set = df.format(((float)bmi_weight / ((float)(bmi_height * bmi_height) /10000)*18.28)-42.5) ;
      request.setAttribute("name", name);
      request.setAttribute("height", height);
      request.setAttribute("weight", weight);
      request.setAttribute("beat", beat);
      request.setAttribute("bmi_result", bmi_result);
      request.setAttribute("bmi_result_set", bmi_result_set);
      
      Nutrient nu_beat = new Nutrient();
      if(Integer.parseInt(beat) > 100) {
    	  nu_beat = dao.effrec("혈압관리");
      }
      request.setAttribute("nu_beat", nu_beat);
    	  
    	  
      List<Nutrient> efflist = new ArrayList<>();
      for(int i=1; i<=10; i++) {
         if(request.getParameter("eff"+i)!=null) {
            Nutrient nu1 = dao.effrec(request.getParameter("eff"+i));
            efflist.add(nu1);
         }
      }
      List<Nutrient> catelist = new ArrayList<>();
      request.setAttribute("efflist", efflist);
      String [] cate = {"종합비타민","유산균","비타민B","비타민C","칼슘","마그네슘","루테인","오메가3"};
      for(int j=1; j<=8; j++) {
         if(request.getParameter("category"+j)==null) {
            Nutrient nu2 = dao.caterec(cate[j-1]);
            catelist.add(nu2);
         }
      }
      request.setAttribute("efflist", efflist);
      request.setAttribute("catelist", catelist);
      
      return "nutrients/nu_rec";
   } // nu_list
   
   @RequestMapping("nu_allnut")
   public String nu_allnut(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      request.getSession().setAttribute("pageNum", "1");
      int pageNum = 1;
      int boardcount = 0;
      try {
         pageNum = Integer.parseInt(request.getParameter("pageNum"));
      } catch (NumberFormatException e) {}
      String find = "";
      String column = "";
      String orderby = "n.no";
      
      //검색창에 값넣고 검색
      if(request.getParameter("column")==null && request.getParameter("find") != null) { 
         column="n.name";
         find = request.getParameter("find");
         boardcount = dao.nu_boardCount("name", find);
         request.setAttribute("column2",column);
         request.setAttribute("find2",find);
         request.setAttribute("orderby2", orderby);
      }else if(request.getParameter("orderby")==null && request.getParameter("column")==null 
            && request.getParameter("find") == null &&request.getParameter("column2")==null) {
         column="name";
         find="";
         boardcount = dao.nu_boardCount(column, find);
         request.setAttribute("column2",column);
         request.setAttribute("find2",find);
         request.setAttribute("orderby2", orderby);
         
      }else if(column != null && request.getParameter("findval") != null &&request.getParameter("column2")==null) {
         column = request.getParameter("column");
         find = request.getParameter("findval");
         boardcount = dao.nu_boardCount(column, find);
         request.setAttribute("column2",column);
         request.setAttribute("find2",find);
         request.setAttribute("orderby2", orderby);
      }
      if(request.getParameter("orderby") != null) {
         System.out.println("//orderby 좋아요랑 조회수");
         column = "name";
         find="";
         orderby = request.getParameter("orderby")+" desc";
         boardcount = dao.nu_boardCount(column, find);
         request.setAttribute("column2",column);
         request.setAttribute("find2",find);
         request.setAttribute("orderby2", orderby);
      }
      if(request.getParameter("pagee")!=null) {
        column = request.getParameter("column2");
         find = request.getParameter("find2");
         orderby = request.getParameter("orderby2");
         pageNum = Integer.parseInt(request.getParameter("pageNum2"));
         boardcount = dao.nu_boardCount(column, find);
         request.setAttribute("column2",column);
         request.setAttribute("find2",find);
         request.setAttribute("orderby2",orderby);
      }
      List<Nutrient> allnutlist = new ArrayList<>(); 
      int limit = 16;
      
      allnutlist = dao.allnut(column,find,orderby,pageNum, limit);
      
      int maxpage = (int)((double)boardcount/limit + 0.95);
      int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
      int endpage = startpage + 9;
      if(endpage > maxpage) endpage = maxpage;
      int boardnum = 1 + (pageNum-1) * limit;
      request.setAttribute("boardcount", boardcount);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("boardnum", boardnum);
      request.setAttribute("startpage", startpage);
      request.setAttribute("endpage", endpage);
      request.setAttribute("maxpage", maxpage);
      request.setAttribute("allnutlist", allnutlist);
      
      return "nutrients/nu_allnut";
   }
   
} // class