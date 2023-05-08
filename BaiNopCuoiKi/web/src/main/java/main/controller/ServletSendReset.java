package main.controller;

import main.bean.User;
import main.bean.UserPemission;
import main.services.SendPhoneOTP;
import main.services.TransServiece;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletSendReset", value = "/ServletSendReset")
public class ServletSendReset extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        UserPemission actor = new UserPemission(user.getUserId());
        SendPhoneOTP newotp = new SendPhoneOTP();
        newotp.sendOTP(request.getParameter("name"));
        request.setAttribute("otp", newotp);
        request.getRequestDispatcher("nhapOtpSdt.jsp").forward(request, response);
    }
}
