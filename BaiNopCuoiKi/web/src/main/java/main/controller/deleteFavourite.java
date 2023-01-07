package main.controller;

import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "deleteFavourite", value = "/deleteFavourite")
public class deleteFavourite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("idacc");
            String idf = request.getParameter("idf");
            useService.getInstance().deletaFavourite(idf,id);
        response.sendRedirect("getUser");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idser = request.getParameter("iduser");
        String tag = request.getParameter("tag");

        HttpSession session = request.getSession(true);
        session.setAttribute("idser", idser);

    }
}
