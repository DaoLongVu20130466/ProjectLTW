package main.controller;

import main.services.AppService;
import main.services.SendPhoneOTP;
import main.services.Utils;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "ServletCheckOTP", value = "/ServletCheckOTP")
public class ServletCheckOTP extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String input = request.getParameter("name1");
        SendPhoneOTP otp = (SendPhoneOTP) session.getAttribute("otp");
        if (otp==null){
            response.sendRedirect("/404Page.html");
        }
        else {
            if (otp.checkOtp(input)) {
                try {
                    String newpassencrypt = Utils.getInstance().toSHA1(otp.getNewpass());
                    useService.getInstance().doimk(otp.getID_user(), newpassencrypt);
                    otp.sendNewPass();
                    session.removeAttribute("otp");
                    request.removeAttribute("arlertw");
                    response.sendRedirect("./DangNhap.jsp");
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                }

            } else {
                if (otp.isOverTime()) {
                    request.setAttribute("arlertw", "lock");
                    useService.getInstance().LockUser(otp.getTargetID());
                } else {
                    request.setAttribute("arlertw", "wrong");
                    request.getRequestDispatcher("/NhapOtpSdt.jsp").forward(request, response);
                }
            }
        }
    }
}
