package main.controller;

import main.bean.Log;
import main.bean.User;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet(name = "ServletUpdateEditProduct", value = "/updateEditProduct")
@MultipartConfig
public class ServletUpdateEditProduct extends HttpServlet {
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
            };
            if (!Files.exists(Paths.get(realPath + "/" + filename))){
                part.write(realPath + "/" + filename);
            };
            if (!Files.exists(Paths.get(realPath + "/" + filename2))){
                part2.write(realPath + "/" + filename2);
            };
            if (!Files.exists(Paths.get(realPath + "/" + filename3))){
                part3.write(realPath + "/" + filename3);
            };
            if (!Files.exists(Paths.get(realPath + "/" + filename4))){
                part4.write(realPath + "/" + filename4);
            };

            String src = "img/Data/" + filename;
            String src2 = "img/Data/" + filename2;
            String src3 = "img/Data/" + filename3;
            String src4 = "img/Data/" + filename4;
            if (src==null || src.equals("img/Data/")){
                src=request.getParameter("src1");
            }
            if (src2==null || src2.equals("img/Data/")){
                src2=request.getParameter("src2");
            }
            if (src3==null || src3.equals("img/Data/")){
                src3=request.getParameter("src3");
            }
            if (src4==null || src3.equals("img/Data/")){
                src4=request.getParameter("src4");
            }

            String tenmonan = request.getParameter("tenmonan");
            String optionSize = request.getParameter("optionSize");
            int giaban = (int) Integer.parseInt(request.getParameter("giaban"));
            int niemyet = (int) Integer.parseInt(request.getParameter("niemyet"));

            String optionType = request.getParameter("optionType");
            int optionCombo = (int) Integer.parseInt(request.getParameter("optionCombo"));
            int optionSale = Integer.parseInt(request.getParameter("optionSale"));
            int optionHot = Integer.parseInt(request.getParameter("optionHot"));
            String Mota = request.getParameter("Mota");
            String idfood = request.getParameter("idmonan");
            String idimg1 = request.getParameter("idimg1");
            String idimg2 = request.getParameter("idimg2");
            String idimg3 = request.getParameter("idimg3");
            String idimg4 = request.getParameter("idimg4");

            ProductsService.getInstance().updateProduct(idfood, tenmonan, optionSize, niemyet, optionType, optionCombo, optionSale, optionHot, Mota, src, giaban, src2, src3, src4, idimg1, idimg2, idimg3, idimg4);
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("auth");
            int level = 2;
            String user0 = user.getUserName();
            String source ="Edit Product";
            String content = "Thay đổi sản phẩm ID= "+idfood;
            String status = "Hoàn thành";
            Log.writeLog(level, user0,source,content,status);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("getAllProductByAdmin");
    }
}
