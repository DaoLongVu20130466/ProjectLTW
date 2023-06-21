package main.controller;

import main.bean.User;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "ServletAddProduct", value = "/ServletAddProduct")
@MultipartConfig
public class ServletAddProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            Part part = request.getPart("myfile");
            String realPath = request.getServletContext().getRealPath("/img/Data");

            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            part.write(realPath + "/" + filename);

            String src = "img/Data/"+filename;

            String tenmonan = request.getParameter("tenmonan");
            String optionSize = request.getParameter("optionSize");
            int giaban = (int) Integer.parseInt(request.getParameter("giaban"));
            int niemyet = (int) Integer.parseInt(request.getParameter("niemyet"));;
            String optionType = request.getParameter("optionType");
            int optionCombo = (int) Integer.parseInt(request.getParameter("optionCombo"));
            int optionSale = Integer.parseInt(request.getParameter("optionSale"));
            int optionHot = Integer.parseInt(request.getParameter("optionHot"));
            String Mota = request.getParameter("Mota");
            ProductsService.getInstance().addProduct(tenmonan,optionSize,niemyet,optionType,optionCombo,optionSale,optionHot,Mota,src,giaban);

        }
        catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("/vn_nhom37_web_BaiNopCuoiKi_war/ServletAddNewProduct");

    }
}
