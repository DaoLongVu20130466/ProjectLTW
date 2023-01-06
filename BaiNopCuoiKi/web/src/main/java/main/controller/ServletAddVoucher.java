package main.controller;

import main.services.VoucherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.crypto.Data;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ServletAddVoucher", value = "/ServletAddVoucher")
public class ServletAddVoucher extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("Names");
        String ma = request.getParameter("Idcode");
        int discount = Integer.parseInt(request.getParameter("discount"));
        int type = Integer.parseInt(request.getParameter("type"));
        String dateStart =request.getParameter("dateStart");
        String dateEnd =request.getParameter("dateStart");
        VoucherService.getInstance().addVoucher(ma,name,type,discount,dateStart,dateEnd);
        response.sendRedirect("/web_war/ServletVoucher");
    }
}
