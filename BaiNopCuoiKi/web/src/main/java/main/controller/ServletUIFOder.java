package main.controller;

import main.bean.Order;
import main.bean.User;
import main.services.OderService;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletUIFOder", value = "/getUIFOder")
public class ServletUIFOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        User user0 = (User) session.getAttribute("auth");
        String  iduser = user0.getUserId();

        String Uid = request.getParameter("isuser") ;
        String Oid = request.getParameter("idoder");
        User user = useService.getInstance().getAllUserByID(iduser);
        ArrayList<Order> list = OderService.getInstance().getAllUserOder(iduser);
        request.setAttribute("alloder", list);
        request.setAttribute("userID", user);
        request.getRequestDispatcher("Donhang.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
