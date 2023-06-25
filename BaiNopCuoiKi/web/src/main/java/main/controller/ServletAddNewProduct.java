package main.controller;

import main.bean.TypeProducts;
import main.bean.User;
import main.bean.UserPemission;
import main.services.AppService;
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int role = user.getRole();

        if (AppService.checkAdmin(role)) {
            UserPemission actor = new UserPemission(user.getUserId());
            if (actor.canAdEditproduct()) {
                ArrayList<TypeProducts> type = ProductsService.getInstance().getTypeProduct();
                request.setAttribute("alltype", type);
                request.getRequestDispatcher("/addProduct.jsp").forward(request, response);
            }else {
                response.sendRedirect("./404ne.html");
            }

        }else {
        request.setAttribute("error", "Bạn không có quền truy cập vào trang này");
        request.getRequestDispatcher("/getIndex").forward(request, response);
         }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
