package main.controller;

import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLock", value = "/ServletLock")
public class ServletLock extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String LockId =  request.getParameter("uid");
        useService.getInstance().LockUser(LockId);
        response.sendRedirect("/web_war/getUserControl");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
