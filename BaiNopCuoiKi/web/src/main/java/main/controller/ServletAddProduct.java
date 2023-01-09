package main.controller;

import main.bean.TypeProducts;
import main.services.AddProduct;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAddProduct", value = "/AddNewProduct")
public class ServletAddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        String tenmonan = request.getParameter("tenmonan");
        int niemyet = (int) Integer.parseInt(request.getParameter("niemyet"));
        int giaban = (int) Integer.parseInt(request.getParameter("giaban"));
        int soluong = (int) Integer.parseInt(request.getParameter("soluong"));
        String Mota = request.getParameter("Mota");
        String optionHot = request.getParameter("optionHot");
        String optionType = request.getParameter("optionType");
        String optionSale = request.getParameter("optionSale");
        String img = request.getParameter("myfile");
        String optionStatus = request.getParameter("optionStatus");
        String optionCombo = request.getParameter("optionCombo");
        String optionSize = request.getParameter("optionSize");
        AddProduct.getInstance().addProduct(tenmonan,optionSize,niemyet,optionType,soluong,optionStatus,optionCombo,optionSale,optionHot,Mota,img,giaban);


       response.sendRedirect("ServletGetAddProduct");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
