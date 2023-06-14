package main.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import main.bean.User;
import main.services.useService;

@WebServlet(name = "ServletUpdateIF", value = "/ServletUpdateIF")
public class ServletUpdateIF extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user = (User) session.getAttribute("auth");
        String id= user.getUserId();
        String hoten = request.getParameter("hoten");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String diachi = request.getParameter("sdt");
        useService.getInstance().updateIF(id,hoten,email,sdt,diachi);
        request.getRequestDispatcher("/Chinhsuathongtin.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
