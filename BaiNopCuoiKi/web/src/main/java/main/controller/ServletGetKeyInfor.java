package main.controller;

import main.bean.Key;
import main.bean.Order;
import main.bean.User;
import main.services.OderService;
import main.services.keyService;
import main.services.useService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetKeyInfor", value = "/ServletGetKeyInfor")
public class ServletGetKeyInfor extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user!=null) {
            String iduser = user.getUserId();
            User usernow = useService.getInstance().getAllUserByID(iduser);
            Key  ifkey= keyService.getInstance().getKey(iduser);
            session.setAttribute("ifkey",ifkey);
            request.getRequestDispatcher("/key.jsp").forward(request, response);
        }
        else {
            response.sendRedirect("/DangNhap.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
