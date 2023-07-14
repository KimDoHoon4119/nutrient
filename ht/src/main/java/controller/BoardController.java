package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Board;
import model.BoardDao;
import model.Comment;
import model.CommentDao;

//http://localhost:8080/jspstudy2/board/writeForm
@WebServlet(urlPatterns= {"/board/*"},initParams= {@WebInitParam(name="view",value="/view/")})
public class BoardController extends MskimRequestMapping{ // MskimRequestMapping : Servlet 파일
   private BoardDao dao = new BoardDao();
   private CommentDao cdao = new CommentDao();
   
   @RequestMapping("writeForm")
   public String writeForm(HttpServletRequest request,HttpServletResponse response) {
      String boardid = (String)request.getSession().getAttribute("boardid");
      if(boardid == null) boardid="1";
      
      String login = (String)request.getSession().getAttribute("login");
       if(boardid.equals("1")) {
          if(login==null || !login.equals("admin")) {
             request.setAttribute("msg", "관리자만 공지사항에 글쓰기가 가능합니다.");
             request.setAttribute("url", request.getContextPath()+"/board/list?boardid="+boardid);
             return "alert"; 
          }
       }   
       return "board/writeForm";
   } // writeForm
   
   @RequestMapping("write")
   public String write(HttpServletRequest request, HttpServletResponse response) {
      String path=request.getServletContext().getRealPath("/")+"/upload/board/";
      File f = new File(path);
      if(!f.exists()) f.mkdirs();
      int size=10*1024*1024;
      MultipartRequest multi = null;
      try {
         multi = new MultipartRequest(request,path,size,"UTF-8");
      } catch(IOException e) {
         e.printStackTrace();
      } 
      Board board = new Board(); // 파라미터 Board 객체 저장
      board.setWriter(multi.getParameter("writer"));
      board.setPass(multi.getParameter("pass"));
      board.setTitle(multi.getParameter("title"));      
      board.setContent(multi.getParameter("content"));
      board.setFile1(multi.getFilesystemName("file1"));
      String boardid = (String)request.getSession().getAttribute("boardid");
      if(boardid==null) boardid="1";
      board.setBoardid(boardid);
      if(board.getFile1()==null) board.setFile1("");
      int num = dao.maxnum();
      board.setNum(++num);
      board.setGrp(num);
      String msg = "게시물 등록 실패";
      String url = "writeForm";
      if(dao.insert(board)) { 
         return "redirect:list?boardid="+boardid;
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return "alert";
   } // write 
   
   @RequestMapping("list")
   public String list(HttpServletRequest request,   HttpServletResponse response) {
	   try {
		request.setCharacterEncoding("utf-8");
	} catch (UnsupportedEncodingException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
      // 1. 한페이지당 10건의 게시물을 출력하기.
      //      pageNum 파라미터값을 저장, 없는 경우는 1로 설정하기.
      // 2. 최근 등록된 게시물이 가장 위에 배치함.
      // 3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력
      //      게시물을 출력부분
      //      페이지 구분 출력 부분
      // 4. 페이지별 게시물번호 출력(boardnum)
      // 5. 첨부파일이 있는경우 @표시
      if (request.getParameter("boardid") != null) {
         request.getSession().setAttribute("boardid",request.getParameter("boardid")); // session = request.getSession()
         request.getSession().setAttribute("pageNum", "1");
      }
      String boardid = (String)request.getSession().getAttribute("boardid");
      if (boardid == null) boardid= "1";
      int pageNum = 1;
      try {
         pageNum = Integer.parseInt(request.getParameter("pageNum"));
      } catch (NumberFormatException e) {}
      String column = request.getParameter("column");
      String find = request.getParameter("find");
      /*
       * column,find 파라미터 중 한개만 존재하는 경우 두개의 파라미터값은 없는 상태로 설정
       */
      if(column==null || column.trim().equals("")) {
    	  column = null;
    	  find = null;
      }
      if(find == null || find.trim().equals("")) {
    	  column = null;
    	  find = null;
      }
      int limit = 10;
      int boardcount = dao.boardCount(boardid,column,find); 
      List<Board> list = dao.list(boardid, pageNum, limit,column,find); 
      // 리턴값은 List
      
      int maxpage = (int)((double)boardcount/limit + 0.95);
      int startpage = ((int)(pageNum/10.0 + 0.9) - 1) * 10 + 1;
      int endpage = startpage + 9;
      if(endpage > maxpage) endpage = maxpage;
      String boardName = "공지사항";
      
      switch(boardid) {
         case "2" : boardName = "자유게시판"; break;
         case "3" : boardName = "QnA"; break;
      }
      
      int boardnum = boardcount - (pageNum -1 ) * limit;
      
      request.setAttribute("boardName", boardName);
      request.setAttribute("boardcount", boardcount);
      request.setAttribute("boardid", boardid);
      request.setAttribute("pageNum", pageNum);
      request.setAttribute("boardNum", boardnum);
      request.setAttribute("list", list);
      request.setAttribute("startpage", startpage);
      request.setAttribute("endpage", endpage);
      request.setAttribute("maxpage", maxpage);
      request.setAttribute("today", new Date());
      
      return "board/list";
   } // list
   
   @RequestMapping("info")
   public String info(HttpServletRequest request,   HttpServletResponse response) {
      int num = Integer.parseInt(request.getParameter("num"));
      String readcnt = request.getParameter("readcnt");
      String boardid = (String)request.getSession().getAttribute("boardid");
      if(boardid == null) boardid = "1";
      if(readcnt==null || !readcnt.equals("f")) dao.readcntAdd(num);
      Board b = dao.selectOne(num);
      request.setAttribute("boardid", boardid);
      request.setAttribute("b", b);
      String boardName = "공지사항";
      switch (boardid) {
         case "2" : boardName ="자유게시판"; break;
         case "3" : boardName ="QnA"; break;
      }
      request.setAttribute("boardName", boardName);
      List<Comment> commlist = cdao.list(num);
      request.setAttribute("commlist", commlist);
      return "board/info";
   } // info
   
   
   
   @RequestMapping("replyForm")
   public String replyForm(HttpServletRequest request,   HttpServletResponse response) {
      // 1. 원글의 num을 파라미터 저장 : num 원글의 게시물번호
      // 2. db에서 num의 게시물을 조회하여 원글의 nun, grp, grplevel, grpstep 정보를 저장
      // 3. 입력 화면 표시
      int num = Integer.parseInt(request.getParameter("num"));
      Board board = dao.selectOne(num);
      request.setAttribute("board", board); // replyForm에서 사용 할수 있게끔 전달
      
      return "board/replyForm";
   } // replyForm
   
   @RequestMapping("reply")
   public String reply(HttpServletRequest request,   HttpServletResponse response) {
      try {
         request.setCharacterEncoding("UTF-8");
      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      }
      Board b = new Board();
      b.setWriter(request.getParameter("writer"));
      b.setPass(request.getParameter("pass"));
      b.setTitle(request.getParameter("title"));
      b.setContent(request.getParameter("content"));
      b.setBoardid(request.getParameter("boardid"));
      b.setGrp(Integer.parseInt(request.getParameter("grp")));
      b.setGrplevel(Integer.parseInt(request.getParameter("grplevel")));
      b.setGrpstep(Integer.parseInt(request.getParameter("grpstep")));
      
      // 2.
      dao.grpStepAdd(b.getGrp(),b.getGrpstep());
      
      // 3.
      int grplevel = b.getGrplevel();
      int grpstep = b.getGrpstep();
      int num = dao.maxnum();
      String msg = "답변 등록시 오류 발생!!";
      String url = "replyForm.jsp?num="+b.getNum();
      b.setNum(++num);
      b.setGrplevel(grplevel + 1);
      b.setGrpstep(grpstep + 1);
      
      
      if(dao.insert(b)) { // 등록 완료
         return "redirect:list?boardid="+b.getBoardid();
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      
      return "alert";
   } // reply
   
   @RequestMapping("updateForm")
   public String updateForm(HttpServletRequest request,   HttpServletResponse response) {
      String boardid = (String)request.getSession().getAttribute("boardid");
      if(boardid == null) boardid="1";
      String login = (String)request.getSession().getAttribute("login");
      if(boardid.equals("1")) {
         if(login==null || !login.equals("admin")) {
            request.setAttribute("msg", "관리자만 수정 가능합니다.");
            request.setAttribute("url", "list?boardid=1");
            return "alert";
         }
      }
      int num = Integer.parseInt(request.getParameter("num"));
      Board b = dao.selectOne(num);
      String boardName = "공지사항";
      switch (boardid) {
         case "2" : boardName = "자유게시판"; break;
         case "3" : boardName = "QnA"; break;
      }
      request.setAttribute("boardName", boardName);
      request.setAttribute("b", b);
      return "board/updateForm";
   } // updateForm
   
   @RequestMapping("update")
   public String update(HttpServletRequest request,HttpServletResponse response) {
      Board board = new Board();
      String path = request.getServletContext().getRealPath("/")+"/upload/board/";
      File f = new File(path);
      if(!f.exists()) f.mkdirs();
      int size=10*1024*1024;
      MultipartRequest multi = null;
         try {
            multi = new MultipartRequest(request,path,size,"UTF-8");
         } catch(IOException e) {
            e.printStackTrace();
         }
         
      board.setNum(Integer.parseInt(multi.getParameter("num")));
      board.setWriter(multi.getParameter("writer"));
      board.setPass(multi.getParameter("pass"));
      board.setTitle(multi.getParameter("title"));
      board.setContent(multi.getParameter("content"));
      board.setFile1(multi.getFilesystemName("file1"));
      if(board.getFile1()==null || board.getFile1().equals("")) {
         board.setFile1(multi.getParameter("file2"));
      }
      
      // 2. 비밀번호 검증
      Board dbBoard = dao.selectOne(board.getNum());
      String msg = "비밀번호가 틀렸습니다.";
      String url = "updateForm?num="+board.getNum();
      
      if(board.getPass().equals(dbBoard.getPass())) {
         if (dao.update(board)) {
            url = "info?num="+board.getNum();
            return "redirect:"+url;
         } else {
            msg = "게시물 수정 실패";
         }
      } 
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return "alert";
   } // update
   
   @RequestMapping("deleteForm")
   public String deleteForm(HttpServletRequest request,   HttpServletResponse response) {
      String boardid = (String)request.getSession().getAttribute("boardid");
      if(boardid == null) boardid="1";
      String login = (String)request.getSession().getAttribute("login");
      if(boardid.equals("1")) {
         if(login==null || !login.equals("admin")) {
            request.setAttribute("msg","관리자만 삭제 가능합니다.");
            request.setAttribute("url","list?boardid=1");
            return "alert";
         }
      }
      return "board/deleteForm";
   } // deleteForm
   
   @RequestMapping("delete")
   public String delete(HttpServletRequest request,HttpServletResponse response) {
      int num = Integer.parseInt(request.getParameter("num"));
      String pass = request.getParameter("pass");
         Board board = dao.selectOne(num); // db의 등록된 비밀번호, 매개변수 num에 맞는 db데이터 저장
      
      String login = (String)request.getSession().getAttribute("login");
       String msg = "게시글의 비밀번호가 틀렸습니다.";
       String url = "deleteForm?num=" + num;
      
      if(pass.equals(board.getPass())) { // 비밀번호가 일치 할때
         if(board.getBoardid().equals("1") && (login==null || !login.equals("admin"))) {
            msg = "공지사항은 관리자만 삭제 가능합니다.";
            url = "list?boardid=" + board.getBoardid();
         } else { // 정삭정인 삭제 권한
            if (dao.delete(num)) {
               url = "list?boardid=" + board.getBoardid();
               request.setAttribute("url", url);
               return "redirect:"+url; // 마무리
            } else { // 삭제 실패
               msg = "게시글 삭제 실패";
               url = "info?num=" + num;
            }
         }
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return "alert";
   } // delete
   
   @RequestMapping("imgupload")
   public String imgupload(HttpServletRequest request,HttpServletResponse response) {
      String path = request.getServletContext().getRealPath("/")+"/upload/imgfile/";
      File f = new File(path);
      if(!f.exists()) f.mkdirs();
      int size=10*1024*1024;
      MultipartRequest multi = null;
         try {
            multi = new MultipartRequest(request,path,size,"UTF-8");
         } catch(IOException e) {
            e.printStackTrace();
         }
      String fileName = multi.getFilesystemName("upload");
       request.setAttribute("fileName", fileName);
      return "ckeditor";
   } // imgupload
   
   @RequestMapping("comment")
   public String comment(HttpServletRequest request,   HttpServletResponse response) {
      try {
            request.setCharacterEncoding("UTF-8");
         } catch(UnsupportedEncodingException e) {
            e.printStackTrace();
         }
      int num = Integer.parseInt(request.getParameter("num"));
      String url = "info?num="+num+"&readcnt=f"; // 댓글 남겨도 조회수 안늘어나게끔
      Comment comm = new Comment();
      comm.setNum(num);
      comm.setWriter(request.getParameter("writer"));
      comm.setContent(request.getParameter("content"));
      int seq = cdao.maxseq(num);
      comm.setSeq(++seq);
      if(cdao.insert(comm)) {
         return "redirect:"+url;
      }
      request.setAttribute("msg", "답글 등록시 오류 발생");
      request.setAttribute("url", url);
      return "alert";
   } // comment
   
   @RequestMapping("commdel")
   public String commdel(HttpServletRequest request,   HttpServletResponse response) {
      int num = Integer.parseInt(request.getParameter("num"));
      int seq= Integer.parseInt(request.getParameter("seq"));
      String url = "info?num="+num+"&readcnt=f"; // 댓글 남겨도 조회수 안늘어나게끔
      
      if(cdao.delete(num,seq)) {
         return "redirect:"+url;
      }
      
      request.setAttribute("msg", "답글 삭제시 오류 발생");
      request.setAttribute("url", url);
      return "alert";
   } // commdel
   
} // class