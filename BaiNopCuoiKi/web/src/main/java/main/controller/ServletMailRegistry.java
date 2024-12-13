package main.controller;

import main.bean.User;
import main.services.Utils;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;

@WebServlet(name = "ServletMailRegistry", value = "/ServletMailRegistry")
public class ServletMailRegistry extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String email = (String) request.getParameter("email");
        String phone = (String) request.getParameter("phone");
        try {
            password= Utils.getInstance().toSHA1(password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        useService.getInstance().registry(username, password, email, phone);
        response.sendRedirect("/BaiNopCuoiKi/DangNhap.jsp");

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
