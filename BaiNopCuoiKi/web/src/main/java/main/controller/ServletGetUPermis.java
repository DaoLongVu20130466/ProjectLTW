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

@WebServlet(name = "ServletGetUPermis", value = "/ServletGetUPermis")
public class ServletGetUPermis extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user0 = (User) session.getAttribute("auth");
        String  idser = user0.getUserId();
        String tag = request.getParameter("tag");
//
        User user = useService.getInstance().getAllUserByID(idser);
        ArrayList<Products> product = (ArrayList<Products>) ProductsService.getInstance().getAllproductFavouriteByUser(idser);
        request.setAttribute("userID", user);
        request.setAttribute("product", product);
        request.setAttribute("tag2",tag);

        request.getRequestDispatcher("yeuthich.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
