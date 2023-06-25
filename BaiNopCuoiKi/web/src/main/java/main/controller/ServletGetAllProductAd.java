package main.controller;

import main.bean.Products;
import main.bean.User;
import main.bean.UserPemission;
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
        String page = request.getParameter("page");
        int page2 ;
        int left;
        int right;
        if(page == null ){
            page2 = 0;
            left = 0;
            right = 1;
        } else {
            page2 = Integer.parseInt(page)*12;
            left = Integer.parseInt(page) - 1 ;
            right = Integer.parseInt(page) +1;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user!=null) {
        UserPemission actor = new UserPemission(user.getUserId());
        if (actor.canWatchproduct()) {
            ArrayList<Products> proPage = (ArrayList<Products>) ProductsService.getInstance().getAllProductByPage(page2);
            int pagee = ProductsService.getInstance().getPageAllPro();
            request.setAttribute("allproducts", proPage);
            request.setAttribute("page", pagee);
            request.setAttribute("left", left);
            request.setAttribute("right", right);
            request.getRequestDispatcher("/SanPham.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("./404ne.html");
        }
        }
        else {
            response.sendRedirect("./DangNhap.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
