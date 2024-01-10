package main.controller;

import main.bean.Products;
import main.bean.User;
import main.bean.UserPemission;
import main.services.ProductsService;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetRole", value = "/ServletGetRole")
public class ServletGetRole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        if (session.getAttribute("auth")!=null) {
            User user = (User) session.getAttribute("auth");
            UserPemission actor = new UserPemission(user.getUserId());
            if (actor.canEditRole()) {
                session.setAttribute("userper", new UserPemission(request.getParameter("uid")));
                request.getRequestDispatcher("QuanLyRole.jsp").forward(request, response);
            } else
                response.sendRedirect("./404Page.html");
        }
        else response.sendRedirect("./404Page.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
