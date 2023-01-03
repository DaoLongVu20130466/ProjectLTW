package main.controller;

import main.bean.Products;

import main.bean.User;
import main.services.useService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getUserControl", value = "/getUserControl")
public class getUserControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> user = useService.getInstance().getAllUser();
        request.setAttribute("alluser", user);
        request.getRequestDispatcher("QuanLyTaiKhoan.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
