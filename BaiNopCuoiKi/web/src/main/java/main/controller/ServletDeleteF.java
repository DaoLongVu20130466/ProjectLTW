package main.controller;

import main.bean.Log;
import main.bean.User;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletDeleteF", value = "/deleteF")
public class ServletDeleteF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idf = request.getParameter("fid");
        useService.getInstance().deletaFood(idf);
        response.sendRedirect("getAllProductByAdmin");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int level = 3;
        String user0 = user.getUserName();
        String source ="Delete Product";
        String content = "Xóa sản phẩm ID= "+idf;
        String status = "Hoàn thành";
        Log.writeLog(level, user0,source,content,status);
        response.sendRedirect("getAllProductByAdmin");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
