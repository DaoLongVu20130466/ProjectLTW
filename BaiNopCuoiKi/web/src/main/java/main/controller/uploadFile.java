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


@WebServlet(name = "uploadFile", value = "/uploadFile")
@MultipartConfig
public class uploadFile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            Part part = request.getPart("myfile");
            String realPath = request.getServletContext().getRealPath("/img/Data");

            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            part.write(realPath + "/" + filename);

            String abc = "img/Data/"+filename;
            request.setAttribute("a",abc);
            request.setAttribute("b",realPath);
            ProductsService.getInstance().addImg(abc);
            request.setCharacterEncoding("UTF-8");
            HttpSession session = request.getSession();
            User user  = (User) session.getAttribute("auth");
            String iduser = user.getIdacc();

            String idf = (String) session.getAttribute("fid2");
            String text = request.getParameter("cmt");
//            ProductsService.getInstance().addComment(idf,iduser,text,text);
        }
        catch (Exception e){}
       request.getRequestDispatcher("test2.jsp").forward(request,response);
    }

}
