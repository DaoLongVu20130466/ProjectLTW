package main.controller;

import main.bean.Order;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletInforOder", value = "/Oder/ServletInforOder")
public class ServletInforOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idOder = request.getParameter("idoder");
        Order order = null;
        request.setAttribute("inforOder",order);
        request.getRequestDispatcher("ChiTietDonHang.jsp").forward(request,response) ;

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
