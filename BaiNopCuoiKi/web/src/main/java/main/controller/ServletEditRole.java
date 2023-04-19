package main.controller;

import main.services.UsrPerServiece;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletEditRole", value = "/ServletEditRole")
public class ServletEditRole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roleId = request.getParameter("Role");
        String targetID = request.getParameter("targetUID");
        UsrPerServiece.getInstance().upDaterole( roleId , targetID);
    }
}
