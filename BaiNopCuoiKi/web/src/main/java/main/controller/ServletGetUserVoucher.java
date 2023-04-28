package main.controller;

import main.bean.User;
import main.bean.Voucher;
import main.services.VoucherService;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetUserVoucher", value = "/GetVoucherUser")
public class ServletGetUserVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user0 = (User) session.getAttribute("auth");
        String  idser = user0.getUserId();
        User usernow = useService.getInstance().getAllUserByID(idser);
        request.setAttribute("userID",usernow);
        User user = useService.getInstance().getAllUserByID(idser);
        ArrayList<Voucher> vcher = VoucherService.getInstance().getControlVoucher();
        request.setAttribute("allvoucher", vcher);
        request.setAttribute("userID",usernow);
        request.getRequestDispatcher("/Voucher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
