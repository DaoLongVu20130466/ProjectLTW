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
        SendPhoneOTP newotp = new SendPhoneOTP(request.getParameter("name"));
        if (newotp.isHaveUser()) {
            newotp.sendOTP();
            session.setAttribute("otp", newotp);
            request.getRequestDispatcher("/NhapOtpSdt.jsp").forward(request, response);
        }
        else {
            session.setAttribute("otp",newotp);
            request.getRequestDispatcher("/QuenMatKhauSDT.jsp").forward(request,response);
        }
    }
}
