package main.controller;

import main.bean.Products;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getAllProduct", value = "/getAllProduct")
public class getAllProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< Updated upstream
        String productinfor = request.getParameter("productInfor");
        List<Products> products = new ArrayList<>();
        if (productinfor != null) {
            products = ProductsService.getInstance().getAllproducts();
        }
        else {
            products = ProductsService.getInstance().getProductByAttb(productinfor);

        }
        if(products!= null) {
            request.setAttribute("allproduct", products);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }
=======
        ArrayList<User> user = useService.getInstance().getAllUser();
        request.setAttribute("allproduct", Products);
        request.getRequestDispatcher("shop_gird.jsp").forward(request, response);
>>>>>>> Stashed changes
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
