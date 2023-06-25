package main.controller;

import main.bean.Log;
import main.bean.Products;

import main.bean.User;
import main.services.AppService;
import main.services.useService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "getUserControl", value = "/getUserControl")
public class    getUserControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ArrayList<User> user = useService.getInstance().getAllUser();
        HttpSession session = request.getSession();
        if (session.getAttribute("auth")!=null) {
            User userr = (User) session.getAttribute("auth");
            int role = userr.getRole();
            if (AppService.checkAdmin(role)) {
                request.setAttribute("alluser", user);
                int level = 0;
                String user0 = userr.getUserName();
                String source = "Xem tài khoản";
                String content = "Xem tài khoản người dùng ";
                String status = "Hoàn thành";
                Log.writeLog(level, user0, source, content, status);
                request.getRequestDispatcher("QuanLyTaiKhoan.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Bạn không có quền truy cập vào trang này");
                request.getRequestDispatcher("/getIndex").forward(request, response);
            }
        }else response.sendRedirect("./404ne.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
