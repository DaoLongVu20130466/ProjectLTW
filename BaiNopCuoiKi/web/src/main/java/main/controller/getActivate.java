package main.controller;

import main.bean.Log;
import main.bean.TypeProducts;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getActivate", value = "/getActivate")
public class getActivate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Log> allLog = LogController.getAllLog();
        request.setAttribute("allLog", allLog);
        request.getRequestDispatcher("HoatDong.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
