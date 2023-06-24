package main.controller;

import main.bean.Log;
import main.bean.User;
import main.services.ProductsService;
import main.services.useService;

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
            Part part2 = request.getPart("myfile2");
            Part part3 = request.getPart("myfile3");
            Part part4 = request.getPart("myfile4");


            String realPath = request.getServletContext().getRealPath("/img/Data");

            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String filename2 = Paths.get(part2.getSubmittedFileName()).getFileName().toString();
            String filename3 = Paths.get(part3.getSubmittedFileName()).getFileName().toString();
            String filename4 = Paths.get(part4.getSubmittedFileName()).getFileName().toString();

            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            part.write(realPath + "/" + filename);
            part2.write(realPath + "/" + filename2);
            part3.write(realPath + "/" + filename3);
            part4.write(realPath + "/" + filename4);

            String src = "img/Data/"+filename;
            String src2 = "img/Data/"+filename2;
            String src3 = "img/Data/"+filename3;
            String src4 = "img/Data/"+filename4;


            String Idfood = "CG" + useService.getInstance().checkIDFOOD();
            String tenmonan = request.getParameter("tenmonan");
            String optionSize = request.getParameter("optionSize");
            int giaban = (int) Integer.parseInt(request.getParameter("giaban"));
            int niemyet = (int) Integer.parseInt(request.getParameter("niemyet"));;
            String optionType = request.getParameter("optionType");
            int optionCombo = (int) Integer.parseInt(request.getParameter("optionCombo"));
            int optionSale = Integer.parseInt(request.getParameter("optionSale"));
            int optionHot = Integer.parseInt(request.getParameter("optionHot"));
            String Mota = request.getParameter("Mota");
            ProductsService.getInstance().addProduct(Idfood,tenmonan,optionSize,niemyet,optionType,optionCombo,optionSale,optionHot,Mota,src,giaban,src2,src3,src4);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("auth");
            int level = 1;
            String user0 = user.getUserName();
            String source ="Add New Product";
            String content = "Thêm sản phẩm ID= "+Idfood;
            String status = "Hoàn thành";
            Log.writeLog(level, user0,source,content,status);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("ServletAddNewProduct");


    }
}
