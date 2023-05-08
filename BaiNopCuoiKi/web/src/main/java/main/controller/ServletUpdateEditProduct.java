package main.controller;

import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletUpdateEditProduct", value = "/updateEditProduct")
public class ServletUpdateEditProduct extends HttpServlet {
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
        String idfood = request.getParameter("idmonan");

        request.setAttribute("1",tenmonan);
        request.setAttribute("2",optionSize);
        request.setAttribute("3",giaban);
        request.setAttribute("4",optionType);
        request.setAttribute("5",soluong);
        request.setAttribute("6",optionStatus);
        request.setAttribute("7",optionCombo);
        request.setAttribute("8",optionHot);
        request.setAttribute("9",optionSale);
        request.setAttribute("10",Mota);
        request.setAttribute("11",img);
        request.setAttribute("12",niemyet);
        request.setAttribute("13",idfood);


        ProductsService.getInstance().updateProduct(idfood,tenmonan,optionSize,giaban,optionType,soluong,optionStatus,optionCombo,optionSale,optionHot,Mota,img,niemyet);
        response.sendRedirect("getAllProductByAdmin");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
