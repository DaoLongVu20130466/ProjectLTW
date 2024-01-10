package main.controller;

import main.bean.Log;
import main.bean.User;
import main.services.Utils;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "Login", value = "/checkLogin")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/DangNhap.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = null;
        user = useService.getInstance().checkLogin(username,password );
        if(user==null){
            request.setAttribute("error", "Username or password is incorrect");
            request.getRequestDispatcher("/DangNhap.jsp").forward(request, response);
        }else{
            HttpSession session = request.getSession(true);
            session.setAttribute("auth", user);

             session.setAttribute("login","Xin chào ");
             int level = 0;
             String user0 = username;
             String src ="Login";
             String content = "Đã đăng nhập vào hệ thống";
             String status = "Hoàn thành";
//             Log.writeLog(level, user0,src,content,status);
         response.sendRedirect("getIndex");

        }
    }
    }

