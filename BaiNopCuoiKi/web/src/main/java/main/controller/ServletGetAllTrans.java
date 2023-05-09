package main.controller;

import main.bean.Log;
import main.bean.User;
import main.bean.UserPemission;
import main.services.AppService;
import main.services.LogService;
import main.services.TransServiece;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetAllTrans", value = "/ServletGetAllTrans")
public class ServletGetAllTrans extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        UserPemission actor = new UserPemission(user.getUserId());
        if (actor.canWatchTran()){
            session.setAttribute("alltran", TransServiece.getInstance().getallTrans());
            request.getRequestDispatcher("TruyXuatNhapHang.jsp").forward(request, response);
        }
        else
            response.sendRedirect("404Page.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
