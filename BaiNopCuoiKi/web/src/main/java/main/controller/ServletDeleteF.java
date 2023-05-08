package main.controller;

import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeleteF", value = "/deleteF")
public class ServletDeleteF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idf = request.getParameter("fid");
        String size = request.getParameter("size");
        useService.getInstance().deletaFood(idf,size);
        response.sendRedirect("/getAllProductByAdmin");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
