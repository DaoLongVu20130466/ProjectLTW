package main.controller;


import main.bean.Cart;
import main.bean.Products;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "addtoCart", value = "/addtoCart")
public class addtoCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id= request.getParameter("id");
        String sl=  request.getParameter("soluong");
        Products p = ProductsService.getInstance().getProductByID(id);
        if (sl == null) {
            p.setQuantity(1);
        }else {
            int soluong = Integer.parseInt(sl);
            p.setQuantity(soluong);
        }
        HttpSession session = request.getSession(true);
        Cart cart=(Cart) session.getAttribute("cart");

        if(cart==null) {
            cart=new Cart();
        }
        cart.put(p);

        session.setAttribute("cart",cart);
        request.getRequestDispatcher("/getAllProduct").forward(request,response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
