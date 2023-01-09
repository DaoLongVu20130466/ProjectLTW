package main.controller;

import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeletaFavourite", value = "/deletaFavourite")
public class ServletDeletaFavourite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String id = request.getParameter("idacc");
        String idf = request.getParameter("idf");

        useService.getInstance().deletaFavourite(idf,id);
        response.sendRedirect("getAllFavourite");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
