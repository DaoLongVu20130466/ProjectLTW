package main.controller;

import main.bean.Log;
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

@WebServlet(name = "AddCommentServlet", value = "/AddCommentServlet")
@MultipartConfig
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            Part part = request.getPart("img_cmt");
            String realPath = request.getServletContext().getRealPath("/img/Data");

            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            if(!Files.exists(Paths.get(realPath + "/" + filename))){
                part.write(realPath + "/" + filename);

            }


            String src = "img/Data/"+filename;

            HttpSession session = request.getSession();
            User user  = (User) session.getAttribute("auth");
            String iduser = user.getIdacc();

            String idf = (String) session.getAttribute("fid2");
            String text = request.getParameter("cmt");
            ProductsService.getInstance().addComment(idf,iduser,text,src);
            int level = 0;
            String user0 = user.getUserName();
            String source = "AddCommentServlet";
            String content = "Comment";
            String status = "Hoàn thành";
            Log.writeLog(level, user0, source, content, status);
        }
        catch (Exception e){}
        response.sendRedirect("detail");

    }

}
