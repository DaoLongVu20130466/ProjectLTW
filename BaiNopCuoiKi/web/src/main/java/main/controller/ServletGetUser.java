package main.controller;


import main.bean.User;
import main.services.useService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

import java.io.IOException;


@WebServlet(name = "getUser", value = "/getUser")
public class ServletGetUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user0 = (User) session.getAttribute("auth");
        String iduser = user0.getUserId();

        User user = useService.getInstance().getAllUserByID(iduser);
        request.setAttribute("userID",user);

        request.getRequestDispatcher("mama.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}
