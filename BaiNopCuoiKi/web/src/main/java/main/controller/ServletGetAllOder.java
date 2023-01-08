package main.controller;

import main.bean.Order;
import main.bean.Voucher;
import main.services.OderService;
import main.services.VoucherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

    @WebServlet(name = "ServletGetAllOder", value = "/Admin/ServletGetAllOder")
public class ServletGetAllOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Order> oder = OderService.getInstance().getAllOder();
        request.setAttribute("alloder", oder);
        request.getRequestDispatcher("../Truysuatdonhang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
