package main.controller;

import main.bean.TypeProducts;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "Servlet", value = "/ServletAddProduct")
public class ServletAddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String tenmonan = request.getParameter("tenmonan");
        String optionSize = request.getParameter("optionSize");
        int giaban = (int) Integer.parseInt(request.getParameter("giaban"));
        String optionType = request.getParameter("optionType");
        int soluong = (int) Integer.parseInt(request.getParameter("soluong"));
        String optionStatus = request.getParameter("optionStatus");
        int optionCombo = (int) Integer.parseInt(request.getParameter("optionCombo"));
        String optionSale = request.getParameter("optionSale");
        String optionHot = request.getParameter("optionHot");
        String Mota = request.getParameter("Mota");
        String img = request.getParameter("myfile");
        int niemyet = (int) Integer.parseInt(request.getParameter("niemyet"));

        request.setAttribute("1",tenmonan);

        ArrayList<TypeProducts> type  = ProductsService.getInstance().getTypeProduct();
        request.setAttribute("alltype",type);


        ProductsService.getInstance().addProduct(tenmonan,optionSize,giaban,optionType,soluong,optionStatus,optionCombo,optionSale,optionHot,Mota,img,niemyet);


        response.sendRedirect("ServletAddNewProduct");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
