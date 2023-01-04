package main.services;

import main.bean.Products;
import main.db.DBC;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductService", value = "/ProductService")
public class ProductService extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBC dbc = new DBC();
        List<Products> list = dbc.getAllProducts();
        request.setAttribute("listP",dbc);
        request.getRequestDispatcher("shop-gird.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
