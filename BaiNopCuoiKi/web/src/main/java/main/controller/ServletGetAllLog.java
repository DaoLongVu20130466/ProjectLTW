package main.controller;

import main.bean.Log;
import main.bean.Order;
import main.bean.User;
import main.services.AppService;
import main.services.LogService;
import main.services.OderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetAllLog", value = "/ServletGetAllLog")
public class ServletGetAllLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int role = user.getRole();
        if (AppService.checkAdmin(role)) {
            ArrayList<Log> log = LogService.getInstance().getAlllog();
            request.setAttribute("alllog", log);
            request.getRequestDispatcher("Log.jsp").forward(request, response);
        }else {
            request.setAttribute("error", "Bạn không có quền truy cập vào trang này");
            request.getRequestDispatcher("getIndex").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
