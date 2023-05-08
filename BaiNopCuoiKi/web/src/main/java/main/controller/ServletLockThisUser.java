package main.controller;

import main.bean.User;
import main.bean.UserPemission;
import main.services.SendPhoneOTP;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletLockThisUser", value = "/ServletLockThisUser")
public class ServletLockThisUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        useService.getInstance().LockUser(user.getUserId());
        session.invalidate();
        response.sendRedirect("DangNhap.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
