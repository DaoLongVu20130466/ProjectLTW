package main.controller;

import main.bean.Products;
import main.bean.User;
import main.services.ProductsService;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAddFavourite", value = "/ServletAddFavourite")
public class ServletAddFavourite extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user0 = (User) session.getAttribute("auth");
        String  idser = user0.getUserId();
        User user = useService.getInstance().getAllUserByID(idser);
        String idacc = (String) user.getIdacc();
        String idfood = (String) request.getAttribute("idf");

        ProductsService.getInstance().addFavoutrite(idfood,idacc);

        User user2 = useService.getInstance().getAllUserByID(idser);
        ArrayList<Products> product = (ArrayList<Products>) ProductsService.getInstance().getAllproductFavouriteByUser(idser);
        request.setAttribute("userID", user0);
        request.setAttribute("product", product);

        response.sendRedirect("getAllFavourite");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
