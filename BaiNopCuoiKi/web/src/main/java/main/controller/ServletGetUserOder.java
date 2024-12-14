package main.controller;

import main.bean.Order;
import main.bean.User;
import main.bean.UserPemission;
import main.services.OderService;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.Permission;

@WebServlet(name = "ServletGetUserOder", value = "/ServletGetUserOder")
public class ServletGetUserOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idOder = request.getParameter("idoder");
        HttpSession session =request.getSession();
        User user0 = (User) session.getAttribute("auth");

        UserPemission ps = new UserPemission(user0.getUserId());
        String  iduser = user0.getUserId();
        User usernow = useService.getInstance().getAllUserByID(iduser);
        request.setAttribute("userID",usernow);
        Order order = OderService.getInstance().getInforOderByUser(idOder,usernow.getIdacc());
        order.update();
        request.setAttribute("inforOder",order);
        request.getRequestDispatcher("/ChiTietDonHangUser.jsp").forward(request,response) ;

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
