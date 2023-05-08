package main.controller;

import main.bean.Products;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getProduct", value = "/detail")
public class ServletGetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String fid = request.getParameter("fid");
//        String type = request.getParameter("type");
//        Products pro = ProductsService.getInstance().getProductByID(fid);
//        ArrayList<Products> allProductByID = (ArrayList<Products>) ProductsService.getInstance().getAllProductByID(type);
//
//        request.setAttribute("product", pro);
//        request.setAttribute("allProductByID", allProductByID);
//        request.getRequestDispatcher("product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
