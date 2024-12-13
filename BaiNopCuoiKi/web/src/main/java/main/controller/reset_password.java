package main.controller;


import main.bean.Cart;
import main.bean.Products;
import main.services.ProductsService;
import main.services.useService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "reset_password", value = "/reset_password")
public class reset_password extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String hash = request.getParameter("hash");
        String idacc= useService.getInstance().checkRSP(hash);
        if(idacc!=null){
            request.setAttribute("idacc",idacc);
            request.getRequestDispatcher("/reset_password.jsp").forward(request,response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}