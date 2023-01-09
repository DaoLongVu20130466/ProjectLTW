package main.controller;

import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAddNewProduct", value = "/ServletAddNewProduct")
public class ServletAddNewProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<TypeProducts> type  = ProductsService.getInstance().getTypeProduct();
        request.setAttribute("alltype",type);
        request.getRequestDispatcher("addProduct.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
