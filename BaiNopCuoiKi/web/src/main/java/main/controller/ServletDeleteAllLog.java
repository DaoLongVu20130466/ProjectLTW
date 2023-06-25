package main.controller;

import main.bean.User;
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
        User user = (User) session.getAttribute("auth");
        UserPemission userPemission = new UserPemission(user.getUserId());
        if (userPemission.canRemoveLog()){
            LogService.getInstance().clearAllLog();
            request.getRequestDispatcher("./getActivate").forward(request, response);
        }else
            response.sendRedirect("./404ne.html");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
