package main.controller;

import main.bean.Products;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getAllProductByAdmin", value = "/getAllProductByAdmin")
public class getAllProductByAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        ArrayList<Products> proPage = (ArrayList<Products>) ProductsService.getInstance().getAllProductByPage(1);

        request.setAttribute("allproducts", proPage);
        request.setAttribute("allproducts2", products);
        request.getRequestDispatcher("SanPham.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
