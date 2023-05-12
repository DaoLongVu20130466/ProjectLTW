package main.controller;

import main.bean.UserPemission;
import main.services.LogService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeleteAllLog", value = "/ServletDeleteAllLog")
public class ServletDeleteAllLog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserPemission userPemission = (UserPemission) session.getAttribute("permission");
        if (userPemission.canRemoveLog()){
            LogService.getInstance().clearLog(request.getParameter("LogId"));
        }else
            response.sendRedirect("/web_war/404Page.html");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
