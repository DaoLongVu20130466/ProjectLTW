package main.controller;

import main.bean.Products;
import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletEditProduct", value = "/editProduct")
public class ServletEditProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idf = request.getParameter("fid");
        String size = request.getParameter("size");
        ArrayList<TypeProducts> type  = ProductsService.getInstance().getTypeProduct();
        request.setAttribute("alltype",type);

//        Products pro = ProductsService.getInstance().getProductByIDSize(idf,size);
//        request.setAttribute("pro",pro);
        request.getRequestDispatcher("/editProdcut.jsp").forward(request,response);



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
