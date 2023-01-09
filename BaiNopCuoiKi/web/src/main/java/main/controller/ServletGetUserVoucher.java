package main.controller;

import main.bean.Voucher;
import main.services.VoucherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetUserVoucher", value = "/ServletGetUserVoucher")
public class ServletGetUserVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Voucher> vcher = VoucherService.getInstance().getControlVoucher();
        request.setAttribute("allvoucher", vcher);
        request.getRequestDispatcher("Voucher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
