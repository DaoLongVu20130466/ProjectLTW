package main.controller;

import main.bean.DashBoard;
import main.services.DashBoardService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "ServletGetInForDBbyM", value = "/ServletGetInForDBbyM")
public class ServletGetInForDBbyM extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
        LocalDateTime now = LocalDateTime.now();
        String nowYear = dtf.format(now);
        DashBoard db = new DashBoard(DashBoardService.getInstance().getOderByYear(nowYear));
        request.setAttribute("dashBoard", db);
        request.setAttribute("dbm",request.getParameter("dbmo"));
        request.getRequestDispatcher("DoanhThu.jsp").forward(request,response) ;
    }
}
