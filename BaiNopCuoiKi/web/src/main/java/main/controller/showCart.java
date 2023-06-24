package main.controller;

import main.bean.ApiController;
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

        if(cart!=null) {
            ApiController control = new ApiController();
            request.setAttribute("listdiachi1", control.getDistrictbyPvID("202"));
            request.setAttribute("stage",0);
            session.setAttribute("total", AppService.intToVND((int) cart.getTotal()));
                request.getRequestDispatcher("GioHang.jsp").forward(request, response);
            }
        else{
            request.getRequestDispatcher("/GioHang.jsp").forward(request, response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
