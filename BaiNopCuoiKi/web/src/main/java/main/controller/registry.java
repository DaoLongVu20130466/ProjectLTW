package main.controller;

import main.bean.User;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "registry", value = "/registry")
public class registry extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = (String) request.getParameter("username");
        String password = (String) request.getParameter("password");
        String email = (String) request.getParameter("email");
        String phone = (String) request.getParameter("phone");
        String rs = useService.getInstance().chekUser(username);
        String rs1 = useService.getInstance().chekemail(email);
        String rs2 = useService.getInstance().chekSDT(phone);
        if (rs!=null){
            request.setAttribute("error", rs);
            request.getRequestDispatcher("/DangKy.jsp").forward(request, response);
        }if(rs1!=null) {
            request.setAttribute("error", rs1);
            request.getRequestDispatcher("/DangKy.jsp").forward(request, response);
        }

        if(rs2!=null) {
        request.setAttribute("error", rs2);
        request.getRequestDispatcher("/DangKy.jsp").forward(request, response);
    } if(rs==null && rs2==null && rs1==null) {
            useService.getInstance().registry(username, password, email, phone);
            response.sendRedirect("/DangNhap.jsp");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/DangKy.jsp").forward(request, response);
    }
}
