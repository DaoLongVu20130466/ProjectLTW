package main.controller;

import main.bean.Products;
import main.services.ProductsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getAllProduct", value = "/getAllProduct")
public class getAllProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< Updated upstream
        ArrayList<User> user = useService.getInstance().getAllUser();
        request.setAttribute("allproduct", products);
        request.getRequestDispatcher("shop_grid.jsp").forward(request, response);
=======
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        request.setAttribute("allproducts", products);
        request.getRequestDispatcher("shop-grid.jsp").forward(request, response);
>>>>>>> Stashed changes
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}



}
