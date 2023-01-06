package main.controller;

import main.bean.Products;
<<<<<<< Updated upstream
import main.bean.User;
import main.services.ProductsService;
import main.services.useService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
=======
import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
>>>>>>> Stashed changes
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getAllProduct", value = "/getAllProduct")
public class getAllProduct extends HttpServlet {
<<<<<<< Updated upstream
    private Object Products;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
<<<<<<< Updated upstream
<<<<<<< Updated upstream
        ArrayList<User> user = useService.getInstance().getAllUser();
        request.setAttribute("allproduct", products);
        request.getRequestDispatcher("shop_grid.jsp").forward(request, response);
=======
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        request.setAttribute("allproducts", products);
        request.getRequestDispatcher("shop-grid.jsp").forward(request, response);
>>>>>>> Stashed changes
=======

        String productinfor = request.getParameter("productInfor");
        List<Products> products = new ArrayList<>();
        if (productinfor != null) {
            products = ProductsService.getInstance().getAllproducts();
        }
        else {
            products = ProductsService.getInstance().getProductByAttb(productinfor);

        }
        if(products!= null) {
            request.setAttribute("allproduct", products);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        }

        ArrayList<User> user = useService.getInstance().getAllUser();
        request.setAttribute("allproduct", Products);
        request.getRequestDispatcher("shop_gird.jsp").forward(request, response);

>>>>>>> Stashed changes
    }


=======
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        int page2  ;
        if(page == null ){
            page2 = 1;
        } else {
            page2 = Integer.parseInt(page);
        }
        ArrayList<Products> products = (ArrayList<Products>) ProductsService.getInstance().getAllproducts();
        int numberP = products.size()/12 +1 ;

        ArrayList<TypeProducts> typePro = (ArrayList<TypeProducts>) ProductsService.getInstance().getTypeProduct();
        ArrayList<Products> proPage = (ArrayList<Products>) ProductsService.getInstance().getAllProductByPage(page2);
        ArrayList<Products> producBySale = (ArrayList<Products>) ProductsService.getInstance().getAllproductBySale();

        request.setAttribute("allproducts",proPage);
        request.setAttribute("numberP",numberP);
        request.setAttribute("alltype", typePro);
        request.setAttribute("productBySale", producBySale);

        request.getRequestDispatcher("shop-grid.jsp").forward(request, response);
    }

>>>>>>> Stashed changes
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
<<<<<<< Updated upstream
}



}
=======
}
>>>>>>> Stashed changes
