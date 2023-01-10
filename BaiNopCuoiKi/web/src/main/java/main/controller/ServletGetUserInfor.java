package main.controller;

import main.bean.User;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletGetUserInfor", value = "/getUserInfor")
public class ServletGetUserInfor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("auth");
        String iduser = user.getUserId();

        User userinfor = useService.getInstance().getAllUserByID(iduser);
        session.setAttribute("userID", userinfor);
        request.getRequestDispatcher("user.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
