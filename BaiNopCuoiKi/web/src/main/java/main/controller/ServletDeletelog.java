package main.controller;

import main.bean.Log;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeletelog", value = "/ServletDeletelog")
public class ServletDeletelog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String logId = request.getParameter("fid");
        Log.getInstance().DeleteLog(logId);
        request.getRequestDispatcher("/getActivate").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
