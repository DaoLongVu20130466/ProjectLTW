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

@WebServlet(name = "ServletGetUserInfor", value = "/getUserInfor")
public class ServletGetUserInfor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user!=null) {
            String iduser = user.getUserId();
            User usernow = useService.getInstance().getAllUserByID(iduser);

            User userinfor = useService.getInstance().getAllUserByID(iduser);
            session.setAttribute("userID", userinfor);
            ArrayList<Order> list = OderService.getInstance().getAllUserOder(usernow.getIdacc());
            session.setAttribute("alloder", list);
            request.getRequestDispatcher("/user.jsp").forward(request, response);

        }
        else {
            response.sendRedirect("/DangNhap.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
