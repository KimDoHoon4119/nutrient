package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import gdu.mskim.MSLogin;
import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Member;
import model.MemberDao;
import model.Nutrient;
import model.NutrientDao;

// /member/* : http://localhost:8080/jspstudy2/member/ 이후의 어떤 요청이 들어와도 MemberController 서블릿이 호출됨

@WebServlet(urlPatterns= {"/member/*"},initParams= {@WebInitParam(name="view",value="/view/")})
public class MemberController extends MskimRequestMapping{ // MskimRequestMapping : Servlet 파일
   private MemberDao dao = new MemberDao();
   private NutrientDao ndao = new NutrientDao();
   @RequestMapping("loginForm")
   public String loginForm(HttpServletRequest request,HttpServletResponse response) {
      //String referer = request.getHeader( "REFERER");
      request.setAttribute("referer",request.getHeader( "REFERER"));
      return "member/loginForm"; // view 선택
   }
   
   public String loginIdCheck(HttpServletRequest request, HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      String id = request.getParameter("id");
      String login = (String)request.getSession().getAttribute("login");
      if(login==null) {
         request.setAttribute("msg","로그인하세요");
         request.setAttribute("url","loginForm");
         return "alert";
      }else if(!login.equals("admin")&&!id.equals(login)) {
         request.setAttribute("msg","본인만 거래 가능");
         request.setAttribute("url","main");
         return "alert";
      }
      return null;
   }
   
   @RequestMapping("login")
   public String login(HttpServletRequest request,HttpServletResponse response) {
      // 1. 파라미터 변수 저장하기
      String id = request.getParameter("id");
      String pass = request.getParameter("pass");
      // 2. 비밀번호 검증
      Member mem = dao.selectOne(id);
      String msg = null;
      String url= null;
      if(mem == null) {
         msg = "아이디를 확인하세요.";
         url = "loginForm";
      } else if (!pass.equals(mem.getPass())) {
         msg = "비밀번호가 다릅니다.";
         url = "loginForm";
      } else {
         request.getSession().setAttribute("login", id);
         String referer = request.getParameter("referer");
         String login = (String)request.getSession().getAttribute("login");
         //msg = "반갑습니다. " + mem.getName() + "님"+referer+login;
         if(referer.equals("http://localhost:8080/ht/member/myPage?id=")) {
            msg="반갑습니다. " + mem.getName() + "님";
            url = referer+login;
         }else if(referer.equals("http://localhost:8080/ht/member/join")){
            msg="반갑습니다. " + mem.getName() + "님";
            url="../nutrients/main";
         }else if(referer.equals("http://localhost:8080/ht/nutrients/likey")){
            msg="반갑습니다. " + mem.getName() + "님";
            url="../nutrients/main";
         }else if(referer.equals("http://localhost:8080/ht/member/myNutadd")){
            msg="반갑습니다. " + mem.getName() + "님";
            url="../nutrients/main";
         }else {
            msg = "반갑습니다. " + mem.getName() + "님";
            url = referer;
         }
         //url = "http://localhost:8080/ht/nutrients/main";
         
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return "alert";
   } // login
   
   @RequestMapping("logout")
   public String logout(HttpServletRequest request,HttpServletResponse response) {
   request.getSession().invalidate();
   request.setAttribute("msg", "로그아웃 하셨습니다.");
   request.setAttribute("url", "../nutrients/main");
   return "alert";
   }// logout
   
   @RequestMapping("join")
   public String join(HttpServletRequest request,HttpServletResponse response) {
         // 1.파라미터 정보를 Member 객체에 저장
         // 2.Member 객체를 이용하여 db에 insert (member 테이블) 저장
         // 3.가입성공 : 성공 메세지 출력 후 loginForm.jsp 페이지 이동
         //    가입실패 : 실패 메세지 출력 후 joinForm.jsp 페이지 이동
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      
      Member mem = new Member(); // Member객체를 사용 할 수 있는 변수 mem 생성
      
      mem.setName(request.getParameter("name"));
      mem.setId(request.getParameter("id"));
      mem.setPass(request.getParameter("pass"));
      mem.setGender(Integer.parseInt(request.getParameter("gender"))); // gender는 정수형 
      mem.setTel(request.getParameter("tel"));
      mem.setEmail(request.getParameter("email"));
      mem.setWeight(request.getParameter("weight"));
      mem.setHeight(request.getParameter("height"));
      mem.setBeat(request.getParameter("beat"));
       
      if(dao.insert(mem)){
         request.setAttribute("msg", mem.getName()+"님! 회원 가입이 되었습니다.");
         request.setAttribute("url", "loginForm");
      } else {
         request.setAttribute("msg", mem.getName()+"님! 오류가 발생하였습니다.");
         request.setAttribute("url", "joinForm");
      }
      return "alert";
   } // join
   
   @RequestMapping("myPage")
   public String myPage(HttpServletRequest request,HttpServletResponse response) {
      String login = (String)request.getSession().getAttribute("login");
      String id = request.getParameter("id");
      Member mem = dao.selectOne(id);
      if(login==null) {
        request.setAttribute("referer",request.getHeader( "REFERER"));
         request.setAttribute("msg","로그인하세요");
         request.setAttribute("url","loginForm");
         return "alert";
      }else if(!login.equals(id)) {
         request.setAttribute("msg","나의 마이페이지만 열람 가능합니다.");
          request.setAttribute("url","myPage?id="+login);
          return "alert";
      }
          request.setAttribute("mem",mem);
          int memno = mem.getNo();
          List<Nutrient> mynutlist = dao.mynutlist(memno);
          request.setAttribute("mynutlist", mynutlist);
          return "member/myPage";
   }
   
   @RequestMapping("myNut")
   public String myNut(HttpServletRequest request,HttpServletResponse response) {
      String login = (String)request.getSession().getAttribute("login");
      String id = request.getParameter("id");
      if(login==null) {
         request.setAttribute("msg","로그인하세요");
         request.setAttribute("url","loginForm");
         return "alert";
      }else if(!login.equals(id)){
         request.setAttribute("msg","나의 영양제 추가만 가능합니다.");
          request.setAttribute("url","myNut?id="+login);
          return "alert";
      }
      
      request.getSession().setAttribute("id", id);
      Member mem = dao.selectOne(id);
      request.setAttribute("mem",mem);

      request.getSession().setAttribute("pageNum", "1");
      int pageNum = 1;
      try {
         pageNum = Integer.parseInt(request.getParameter("pageNum"));
      } catch (NumberFormatException e) {}
      int limit = 20;
      int boardcount = ndao.nu_boardCount(); // 전체 게시물 등록 건수 리턴, 매개변수 boardid의 타입은 스트링, 리턴값은 Int
      int maxpage = (int)((double)boardcount/limit + 0.95);
      int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
      int endpage = startpage + 9;
      if(endpage > maxpage) endpage = maxpage;
      List<Nutrient> list3 = ndao.list3(pageNum, limit);
      int boardnum = 1 + (pageNum-1) * limit; // 1
      request.setAttribute("boardcount", boardcount); // no db
      request.setAttribute("pageNum", pageNum); // no db
      request.setAttribute("boardnum", boardnum); // no db
      request.setAttribute("startpage", startpage); // no db
      request.setAttribute("endpage", endpage); // no db
      request.setAttribute("maxpage", maxpage); // no db
      request.setAttribute("list3", list3);
      return "member/myNut"; // view 선택
   }
   
   @RequestMapping("myNutadd")
   public String myNutadd(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      String id = (String)request.getSession().getAttribute("login");
      String msg = null;
      String url = null;
      String login = (String)request.getSession().getAttribute("login");
      if (login == null) {
           request.setAttribute("msg", "로그인 하셔야 추천기능을 사용할수있습니다.");
           request.setAttribute("url", "../member/loginForm");
           return "alert";
      }
      
         String Nno = request.getParameter("no");//영양제 no
         int no = Integer.parseInt(Nno);
         Member mem = new Member();
         mem=dao.selectOne(id);
         int memno = mem.getNo();
         //int cnt = dao.mynutaddcnt(id);
         if(dao.mynutdup(memno,no) == 0) {
            if(dao.mynutadd(memno,no)) {
               msg = "영양제 추가 성공";
               url= "myNut?id="+id;
               if(request.getParameter("detail")!=null) {
                  url="../nutrients/infoDetail?no="+no;
               }
            } else {
               msg = "영양제 추가 실패";
               url= "myNut?id="+id;
               if(request.getParameter("detail")!=null) {
                  url="../nutrients/infoDetail?no="+no;
               }
            }
         }else {
            msg = "이미 추가하신 영양제입니다";
             url= "myNut?id="+id;
             if(request.getParameter("detail")!=null) {
                url="../nutrients/infoDetail?no="+no;
             }
         }
         request.setAttribute("msg", msg);
         request.setAttribute("url", url);
         return "alert";
   } // myNutadd


   
   @RequestMapping("myNutdelete")
   public String myNutdelete(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
         String Nno = request.getParameter("no");
         int no = Integer.parseInt(Nno);
        String id = (String)request.getSession().getAttribute("login");
         Member mem = new Member();
         mem = dao.selectOne(id);
         int memno = mem.getNo();
         String msg = null;
         String url = null;
         //int cnt = dao.mynutaddcnt(id);
            if(dao.mynutdelete(memno,no)) {
               msg = "영양제 삭제 성공";
               url= "myPage?id="+id;
            } else {
               msg = "영양제 삭제 실패";
               url= "myPage?id="+id;
            }
         request.setAttribute("msg", msg);
         request.setAttribute("url", url);
         return "alert";
   } // update
   
   
   
   @RequestMapping("id")
   public String id(HttpServletRequest request,HttpServletResponse response) {
      String email = request.getParameter("email");    
      String tel= request.getParameter("tel");
      String id = dao.idSearch(email,tel);
      
      if(id != null) {
         String real_id = id.substring(0,id.length()-2) +"**";
         request.setAttribute("id",real_id);
         return "member/id";
      } else {
         request.setAttribute("msg","아이디를 찾을 수 없습니다.");
         request.setAttribute("url","idForm");
         return "alert";
      }
   } // id
   
   @RequestMapping("pw")
   public String pw(HttpServletRequest request,HttpServletResponse response) {
      String id = request.getParameter("id");
      String email = request.getParameter("email");    
      String tel= request.getParameter("tel");
      String pw = dao.pwSearch(id,email,tel);
      if(pw != null) {
         String real_pw = "**"+pw.substring(2,pw.length());
         request.setAttribute("pw",real_pw);
         return "member/pw";
      } else {
         request.setAttribute("msg","정보에 맞는 비밀번호를 찾을 수 없습니다.");
         request.setAttribute("url","pwForm");
         return "alert";
      }
   } // pw
   
   @RequestMapping("updateForm")
   public String updateForm(HttpServletRequest request,HttpServletResponse response) {
      // 1. id 파라미터 조회
      // 2. 로그인 상태 검증
      //      - 로그아웃상태 : '로그인 하세요' 메세지 출력 후 loginForm.jsp 페이지 호출
      //      - 로그인 상태 : 다른 id조회(관리자 제외) : '내 정보 조회만 가능합니다.' 메세지 출력 후 main.jsp 호출
      // 3. db에서 id에 해당하는 데이터 조회하기
      // 4. 조회된 내용 화면 출력하기   => 이전 데이터를 화면출력, 수정 전 화면 출력
      String id = request.getParameter("id");
      Member mem = dao.selectOne(id);
      String login = (String)request.getSession().getAttribute("login");
      if(login==null) {
          request.setAttribute("msg","로그인하세요");
          request.setAttribute("url","loginForm");
          return "alert";
       }else if(!login.equals(id)){
          request.setAttribute("msg","나의 정보 수정만 가능합니다.");
           request.setAttribute("url","myPage?id="+login);
           return "alert";
       }
      request.setAttribute("mem", mem);
      return "member/updateForm";
   } // updateForm
   
   @RequestMapping("update")
   public String update(HttpServletRequest request,HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      Member mem = new Member();
      mem.setId(request.getParameter("id"));
      mem.setName(request.getParameter("name"));
      mem.setGender(Integer.parseInt(request.getParameter("gender"))); // gender는 정수형 
      mem.setTel(request.getParameter("tel"));
      mem.setEmail(request.getParameter("email"));
      mem.setWeight(request.getParameter("weight"));
      mem.setHeight(request.getParameter("height"));
      mem.setBeat(request.getParameter("beat"));
      mem.setPass(request.getParameter("pass"));

      String login = (String)request.getSession().getAttribute("login");
      Member dbMem = dao.selectOne(login);
      
      String msg = "비밀번호가 틀립니다.";
      String url = "updateForm?id="+mem.getId();
      
      String id = request.getParameter("id");
      if(login==null) {
         request.setAttribute("msg","로그인하세요");
         request.setAttribute("url","loginForm");
         return "alert";
      }else if(!login.equals("admin")&&!id.equals(login)) {
         request.setAttribute("msg","본인만 탈퇴 가능");
         request.setAttribute("url","myPage?id="+login);
         return "alert";
      }
      if(mem.getPass().equals(dbMem.getPass())) {
         if(dao.update(mem)) {
            msg = "수정 성공";
            url= "myPage?id="+mem.getId();
         } else {
            msg = "수정 실패";
         }
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return "alert";
   } // update
   
   @RequestMapping("deleteForm")
   public String deleteForm(HttpServletRequest request,HttpServletResponse response) {
           String id = request.getParameter("id");
         String login = (String)request.getSession().getAttribute("login");
         if(login==null) {
            request.setAttribute("msg","로그인하세요");
            request.setAttribute("url","loginForm");
            return "alert";
         }else if(!login.equals("admin")&&!id.equals(login)) {
            request.setAttribute("msg","본인만 탈퇴 가능");
            request.setAttribute("url","myPage?id="+login);
            return "alert";
         }
      return "member/deleteForm";
   } // updateForm
   
   @RequestMapping("delete")
   public String delete(HttpServletRequest request,HttpServletResponse response) {
       String id = request.getParameter("id");
       String pass = request.getParameter("pass");
       String login = (String)request.getSession().getAttribute("login");
       String msg = null;
       String url = null;
       
       if (id.equals("admin")) {
           request.setAttribute("msg", "관리자는 탈퇴 불가능 합니다.");
           request.setAttribute("url", "list");
           return "alert";
      }
         if(login==null) {
            request.setAttribute("msg","로그인하세요");
            request.setAttribute("url","loginForm");
            return "alert";
         }else if(!login.equals("admin")&&!id.equals(login)) {
            request.setAttribute("msg","본인만 탈퇴 가능");
            request.setAttribute("url","myPage?id="+login);
            return "alert";
         }
        Member dbMem = dao.selectOne(login);
        if(!pass.equals(dbMem.getPass())) {
             request.setAttribute("msg", "비밀번호 오류"); 
             request.setAttribute("url", "deleteForm?id="+id);
             return  "alert";
        }
        if(dao.delete(id)) {
         msg=id +"고객님 탈퇴성공";
            if(login.equals("admin")) {
              url = "list";
            } else {
              request.getSession().invalidate(); // 초기화, 로그아웃
              url = "loginForm";
            }
        } else {
         msg=id +"고객님 탈퇴시 오류 발생. 탈퇴 실패";
            if(login.equals("admin")) {
              url = "list";
            } else {
              url = "info?id="+id;
            }
       }
       request.setAttribute("msg", msg);
       request.setAttribute("url", url);
        return "alert";
   } // delete
   
   @RequestMapping("list")
   public String list(HttpServletRequest request,HttpServletResponse response) {
      request.getSession().setAttribute("pageNum", "1");
      int pageNum = 1;
      try {
         pageNum = Integer.parseInt(request.getParameter("pageNum"));
      } catch (NumberFormatException e) {}
      
      int limit = 20;
      int boardcount = dao.mem_memberCount(); // 전체 게시물 등록 건수 리턴, 매개변수 boardid의 타입은 스트링, 리턴값은 Int
      
      int maxpage = (int)((double)boardcount/limit + 0.95);
      int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
      int endpage = startpage + 9;
      if(endpage > maxpage) endpage = maxpage;
      
      String login = (String)request.getSession().getAttribute("login");
      if(!login.equals("admin")) {
          request.setAttribute("msg","관리자계정으로 로그인하세요");
          request.setAttribute("url","myPage?id="+login);
          return "alert";
      }
      List<Member> list = dao.list();
      int boardnum = 1 + (pageNum-1) * limit; // 1
      request.setAttribute("boardcount", boardcount); // no db
      request.setAttribute("pageNum", pageNum); // no db
      request.setAttribute("boardnum", boardnum); // no db
      request.setAttribute("startpage", startpage); // no db
      request.setAttribute("endpage", endpage); // no db
      request.setAttribute("maxpage", maxpage); // no db
      request.setAttribute("list", list);
     
      return "member/list";
   } // list
   
} // class