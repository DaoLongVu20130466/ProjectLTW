package main.controller;


import main.bean.Cart;
import main.bean.Products;
import main.services.ProductsService;
import main.services.Utils;
import main.services.useService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;

@WebServlet(name = "Datlaimk", value = "/Datlaimk")
public class Datlaimk extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String password = request.getParameter("password2");
        try {
            password= Utils.getInstance().toSHA1(password);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        String idacc= (String) request.getAttribute("idacc");
        useService.getInstance().doimk2(idacc,password);
            request.getRequestDispatcher("/DangNhap.jsp").forward(request,response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}