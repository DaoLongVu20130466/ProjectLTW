package main.controller;

import main.bean.Products;
import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getIndex", value = "/getIndex")
public class ServletGetIndex extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Products> producBySale = (ArrayList<Products>) ProductsService.getInstance().getAllproductBySale();
        ArrayList<TypeProducts> typePro = (ArrayList<TypeProducts>) ProductsService.getInstance().getTypeProduct();
        ArrayList<Products> producByHot = (ArrayList<Products>) ProductsService.getInstance().getAllproductByHot();
        ArrayList<Products> producByCombo = (ArrayList<Products>) ProductsService.getInstance().getAllproductByCombo();

        request.setAttribute("alltype", typePro);
        request.setAttribute("productBySale", producBySale);
        request.setAttribute("productByHot", producByHot);
        request.setAttribute("productByCombo", producByCombo);
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
