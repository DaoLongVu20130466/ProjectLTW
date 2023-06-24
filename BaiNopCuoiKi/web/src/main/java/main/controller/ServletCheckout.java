package main.controller;

import main.bean.Cart;
import main.bean.User;
import main.services.AddOderService;
import main.services.AppService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.file.FileStore;

@WebServlet(name = "ServletCheckout", value = "/ServletCheckout")
public class ServletCheckout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        Cart cart = (Cart) session.getAttribute("cart");
        String adrs1 = request.getParameter("diachi1");
        String adrs2 = request.getParameter("diachi2");
        String vouch = (String) request.getParameter("voucher");



        if (user!=null) {

            if (AddOderService.getInstance().adODer(user.getIdacc(), cart, vouch,adrs1,adrs2)) {
                request.setAttribute("error", "Thanh toán thành công");
                session.setAttribute("cart", new Cart());
                request.getRequestDispatcher("/showCart").forward(request, response);

            } else {
                request.setAttribute("error", "Thanh toán thất bại");
                request.getRequestDispatcher("/showCart").forward(request, response);
            }
        }else{
                request.setAttribute("error", "Vui lòng đang nhập để thanh toán");
                request.getRequestDispatcher("/getIndex").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
