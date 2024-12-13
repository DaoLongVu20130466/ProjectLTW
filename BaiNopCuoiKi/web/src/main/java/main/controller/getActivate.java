package main.controller;

import main.bean.Log;
import main.bean.TypeProducts;
import main.bean.User;
import main.bean.UserPemission;
import main.services.AppService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getActivate", value = "/getActivate")
public class getActivate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        int role = user.getRole();
        if (AppService.checkAdmin(role)) {
            UserPemission actor = new UserPemission(user.getUserId());
            if (actor.canWatchLog()) {
                ArrayList<Log> allLog = LogController.getAllLog();
                request.setAttribute("allLog", allLog);
                request.setAttribute("actor", actor);
                int level = 2;
                String user0 = user.getUserName();
                String source = "getActivate";
                String content = "Xem Log";
                String status = "Hoàn thành";
                Log.writeLog(level, user0, source, content, status);

                request.getRequestDispatcher("HoatDong.jsp").forward(request, response);

            }else {
                response.sendRedirect("./404ne.html");
            }

        }else {
            request.setAttribute("error", "Bạn không có quền truy cập vào trang này");
            request.getRequestDispatcher("/getIndex").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
