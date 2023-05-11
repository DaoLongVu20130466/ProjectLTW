package main.controller;

import main.bean.Log;
import main.bean.Order;
import main.bean.User;
import main.bean.UserPemission;
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
        UserPemission userPemission = new UserPemission(user.getUserId());
        session.setAttribute("permission",userPemission);
        if (user != null) {
            int role = user.getRole();
            if (AppService.checkAdmin(role)&&userPemission.canWatchLog()) {
                ArrayList<Log> log = LogService.getInstance().getAlllog();
                request.setAttribute("alllog", log);
                request.getRequestDispatcher("/TruySuatLog.jsp").forward(request, response);
            } else {
                response.sendRedirect("/web_war/404Page.html");
            }
        } else {
            response.sendRedirect("/web_war/404Page.html");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
