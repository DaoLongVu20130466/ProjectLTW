package main.controller;

import main.bean.Log;
import main.bean.User;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLock", value = "/ServletLock")
public class ServletLock extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String LockId =  request.getParameter("uid");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        useService.getInstance().LockUser(LockId);
        int level = 3;
        String user0 = user.getUserName();
        String source = "ServletLock";
        String content = "Đã khóa người dùng"+ LockId;
        String status = "Hoàn thành";
        Log.writeLog(level, user0, source, content, status);
        response.sendRedirect("/getUserControl");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
