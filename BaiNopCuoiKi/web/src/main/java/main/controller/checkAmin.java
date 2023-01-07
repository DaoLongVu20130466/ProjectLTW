package main.controller;

import main.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "checkAmin", value = "/Amin")
public class checkAmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User auth = (User) session.getAttribute("auth");
        if (auth == null || !auth.checkRole(2)) {
            request.setAttribute("error", "Bạn không có quyền truy cập vào trang này");

            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        } else {
            response.sendRedirect("QuanLyTaiKhoan.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
