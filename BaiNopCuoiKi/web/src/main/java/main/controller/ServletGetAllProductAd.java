package main.controller;

import main.bean.Products;
import main.bean.User;
import main.services.AppService;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetAllProductAd", value = "/getAllProductByAdmin")
public class ServletGetAllProductAd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        ArrayList<Products> proPage = (ArrayList<Products>) ProductsService.getInstance().getAllProductByPage(1);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int role= user.getRole();

        if (AppService.checkAdmin(role)) {

        request.setAttribute("allproducts", proPage);
        request.setAttribute("allproducts2", products);
        request.getRequestDispatcher("/SanPham.jsp").forward(request, response);
    } else {
            request.setAttribute("error", "Bạn không có quền truy cập va trang này");
            request.getRequestDispatcher("/getIndex").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
