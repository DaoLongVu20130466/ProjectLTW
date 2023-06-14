package main.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "aTesstChitietproduct", value = "/test1")
public class aTesstChitietproduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("idfood");
        String soluong = request.getParameter("soluong");
        String size = request.getParameter("radio");
        String ghichu = request.getParameter("ghichu");

        System.out.println(id);
        System.out.println(soluong);
        System.out.println(size);
        System.out.println(ghichu);
        
        request.setAttribute("1",id);

        request.getRequestDispatcher("test.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
