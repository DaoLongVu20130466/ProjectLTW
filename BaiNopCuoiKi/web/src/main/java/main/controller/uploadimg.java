package main.controller;

import main.bean.User;
import main.services.useService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;


@WebServlet(name = "uploadimg", value = "/UploadDownloadFileServlet")
@MultipartConfig
public class uploadimg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("auth");
        String id = user.getUserId();
        try {
            Part part = request.getPart("myfile");
            String realPath = request.getServletContext().getRealPath("/img");
            String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectories(Paths.get(realPath));
            }
            part.write(realPath + "/" + filename);
            String abc = "img/"+filename;

            useService.getInstance().upImg(id,abc);
            User userinfor = useService.getInstance().getAllUserByID(user.getUserId());
            session.setAttribute("userID", userinfor);
            request.getRequestDispatcher("/Chinhsuathongtin.jsp").forward(request,response);

        }
        catch (Exception e){
            e.printStackTrace();
        }


    }

}
