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

@WebServlet(name = "Doimk", value = "/Doimk")
public class Doimk extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/DoiMatKhau.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");

        String currentpassword = (String) request.getParameter("password");
        String newpassword = (String) request.getParameter("newpassword");
        try {
            currentpassword= Utils.getInstance().toSHA1(currentpassword);
            newpassword= Utils.getInstance().toSHA1(newpassword);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }

        if(!auth.getPassword().equals(currentpassword)){
            request.setAttribute("error", "Mật khẩu không chính xác");
            request.getRequestDispatcher("/DoiMatKhau.jsp").forward(request, response);
        }else{
            int level = 2;
            String user0 = auth.getUserName();
            String source = "ServletResetPass";
            String content = "Đổi mật khẩu";
            String status = "Hoàn thành";
            Log.writeLog(level, user0, source, content, status);
            useService.getInstance().doimk(auth.getUserId(),newpassword);
            request.setAttribute("error", "Đổi mật khẩu thành công");
            request.getRequestDispatcher("/DoiMatKhau.jsp").forward(request, response);
        }

    }
    }

