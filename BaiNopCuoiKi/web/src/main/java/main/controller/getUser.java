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
import java.util.List;

@WebServlet(name = "getUser", value = "/getUser")
public class getUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idser = request.getParameter("iduser");
        String tag = request.getParameter("tag");
        if ( idser == null ){
            HttpSession session = request.getSession(true);
            idser = (String) session.getAttribute("idser");
            tag="yeuthich";
        }

        User user = useService.getInstance().getAllUserByID(idser);
        ArrayList<Products> product = (ArrayList<Products>) ProductsService.getInstance().getAllproductFavouriteByUser(idser);
        request.setAttribute("userID", user);
        request.setAttribute("product", product);
        request.setAttribute("tag2",tag);

        request.getRequestDispatcher("/user.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idser = request.getParameter("iduser");
        String tag = request.getParameter("tag");

        HttpSession session = request.getSession(true);
        session.setAttribute("idser", idser);
    }
}
