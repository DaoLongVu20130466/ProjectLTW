package main.controller;

import main.bean.Products;
import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletSearchControl", value = "/SearchControl")
public class ServletSearchControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txt = (String) request.getParameter("txt");
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproductSearch(txt);
        int numberP = products.size()/12 +1 ;

        ArrayList<TypeProducts> typePro = (ArrayList<TypeProducts>) ProductsService.getInstance().getTypeProduct();
        ArrayList<Products> producBySale = (ArrayList<Products>) ProductsService.getInstance().getAllproductBySale();

        request.setAttribute("allproducts",products);
        request.setAttribute("numberP",numberP);
        request.setAttribute("alltype", typePro);
        request.setAttribute("productBySale", producBySale);
        request.getRequestDispatcher("/shop-grid.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
