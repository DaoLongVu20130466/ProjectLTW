package main.controller;

import main.bean.DashBoard;
import main.bean.User;
import main.services.AppService;
import main.services.DashBoardService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "ServletGetInforDB", value = "/ServletGetInforDB")
public class ServletGetInforDB extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int role = user.getRole();
        if (AppService.checkAdmin(role)) {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
            LocalDateTime now = LocalDateTime.now();
            String nowYear = dtf.format(now);
            DashBoard db = new DashBoard(DashBoardService.getInstance().getOderByYear(nowYear));
            request.setAttribute("dashBoard", db);
            request.setAttribute("dbm", "all");
            request.getRequestDispatcher("DoanhThu.jsp").forward(request, response);
        } else {
            request.setAttribute("error", "Bạn không có quền truy cập va trang này");
            request.getRequestDispatcher("/getIndex").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
