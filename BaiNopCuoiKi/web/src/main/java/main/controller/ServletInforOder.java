package main.controller;

import main.bean.Log;
import main.bean.Order;
import main.bean.User;
import main.services.OderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletInforOder", value = "/ServletInforOder")
public class ServletInforOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("auth")!=null) {
            User user = (User) session.getAttribute("auth");
            String idOder = request.getParameter("idoder");
            Order order = OderService.getInstance().getInforOder(idOder);
            order.update();
            request.setAttribute("inforOder", order);
            int level = 0;
            String user0 = user.getUserName();
            String source = "ServletInforOder";
            String content = "Xem chi tiết oder";
            String status = "Hoàn thành";
            Log.writeLog(level, user0, source, content, status);
            request.getRequestDispatcher("/ChiTietDonHang.jsp").forward(request, response);
        }else response.sendRedirect("./404ne.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
