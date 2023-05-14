package main.controller;

import main.bean.Products;
import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getAllProduct", value = "/getAllProduct")
public class getAllProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        int page2  ;
        if(page == null ){
            page2 = 0;
        } else {
            page2 = Integer.parseInt(page)*12;
        }
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        int numberP = products.size()/12 +1 ;
        ArrayList<TypeProducts> typeProD = (ArrayList<TypeProducts>) ProductsService.getInstance().getTypeProduct();
        ArrayList<Products> proDPage = (ArrayList<Products>) ProductsService.getInstance().getAllProductByPage(page2);
        ArrayList<Products> producBySale = (ArrayList<Products>) ProductsService.getInstance().getAllproductBySale();

        request.setAttribute("allproducts",proDPage);
        request.setAttribute("numberP",numberP);
        request.setAttribute("alltype", typeProD);
        request.setAttribute("productBySale", producBySale);

        request.getRequestDispatcher("/shop-grid.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}