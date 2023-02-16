package main.controller;

import main.bean.User;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Doimk", value = "/Doimk")
public class Doimk extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("DoiMatKhau.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        String currentpassword = (String) request.getParameter("password");
        String newpassword = (String) request.getParameter("newpassword");

        if(!auth.getPassword().equals(currentpassword)){
            request.setAttribute("error", "Mật khẩu không chính xác");
            request.getRequestDispatcher("DoiMatKhau.jsp").forward(request, response);
        }else{
            useService.getInstance().doimk(auth.getUserId(),newpassword);
            request.setAttribute("error", "Đổi mật khẩu thành công");
            request.getRequestDispatcher("DoiMatKhau.jsp").forward(request, response);
        }

    }
    }

