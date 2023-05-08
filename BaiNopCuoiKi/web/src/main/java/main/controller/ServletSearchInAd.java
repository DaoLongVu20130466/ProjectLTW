package main.controller;

import main.bean.Products;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletSearchInAd", value = "/ServletSearchInAd")
public class ServletSearchInAd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String txt = (String) request.getParameter("txt");
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproductSearch(txt);
        ArrayList<Products> products2 = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        request.setAttribute("allproducts", products);
        request.setAttribute("allproducts2", products2);

        request.getRequestDispatcher("SanPham.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
