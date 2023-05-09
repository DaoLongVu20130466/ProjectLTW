package main.services;

import main.bean.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServResetPass", value = "/ServResetPass")
public class ServResetPass extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        SendPhoneOTP otp = (SendPhoneOTP) session.getAttribute("otp");
//        otp.sendNewPass(user.getPhoneNumber());
//       useService.getInstance().doimk(user.getUserId(),otp.getNewpass());
        session.invalidate();
        response.sendRedirect("DangNhap.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
