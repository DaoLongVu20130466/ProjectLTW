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

@WebServlet(name = "ServletVoucher", value = "/ServletVoucher")
public class ServletVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Voucher> vcher = VoucherService.getInstance().getControlVoucher();
        request.setAttribute("allvoucher", vcher);
        request.getRequestDispatcher("TangVoucher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
