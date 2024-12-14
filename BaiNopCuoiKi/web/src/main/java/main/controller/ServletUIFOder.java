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
        User user = (User) session.getAttribute("auth");

        User usernow = useService.getInstance().getAllUserByID(user.getUserId());
        request.setAttribute("userID",usernow);
        ArrayList<Order> list = OderService.getInstance().getAllUserOder(usernow.getIdacc());
        for (Order item: list
        ) {
            item.update();
        }
        session.setAttribute("alloder", list);
        request.getRequestDispatcher("/Donhang.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
