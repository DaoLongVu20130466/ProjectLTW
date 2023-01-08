package main.controller;

import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetAddProduct", value = "/ServletGetAddProduct")
public class ServletGetAddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<TypeProducts> typePro = (ArrayList<TypeProducts>) ProductsService.getInstance().getTypeProduct();

        request.setAttribute("alltype", typePro);

        request.getRequestDispatcher("addProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
