package main.controller;

import main.bean.Products;
import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getTypeProduct", value = "/getAllProductByType")
public class getTypeProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");

        ArrayList<Products> allProductByType = (ArrayList<Products>) ProductsService.getInstance().getAllproductsByType(type);
        int numberP = allProductByType.size()/12 +1;
        ArrayList<TypeProducts> typePro = (ArrayList<TypeProducts>) ProductsService.getInstance().getTypeProduct();
        ArrayList<Products> producBySale = (ArrayList<Products>) ProductsService.getInstance().getAllproductBySale();


        request.setAttribute("allproducts", allProductByType);
        request.setAttribute("type",type);
        request.setAttribute("alltype", typePro);
        request.setAttribute("numberP",numberP);
        request.setAttribute("productBySale", producBySale);

        request.getRequestDispatcher("shop-grid.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
