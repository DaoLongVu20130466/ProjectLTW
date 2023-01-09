package main.controller;

import main.bean.Cart;
import main.bean.Products;
import main.services.AppService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Collection;

@WebServlet(name = "showCart", value = "/showCart")
public class showCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        Cart cart=(Cart) request.getSession().getAttribute("cart");
        session.setAttribute("total", AppService.intToVND((int) cart.getTotal()));
        if(cart!=null) {

                request.getRequestDispatcher("GioHang.jsp").forward(request, response);
            }
        else{

            request.getRequestDispatcher("GioHang.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
