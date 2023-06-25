package main.controller;

import main.bean.Order;
import main.bean.User;
import main.bean.UserPemission;
import main.bean.Voucher;
import main.services.AppService;
import main.services.OderService;
import main.services.VoucherService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletGetAllOder", value = "/ServletGetAllOder")
public class ServletGetAllOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user!=null) {
            int role = user.getRole();
            if (AppService.checkAdmin(role)) {
                ArrayList<Order> oder = OderService.getInstance().getAllOder();
                for (Order od: oder
                     ) {
                    od.update();
                }
                request.setAttribute("alloder", oder);
                UserPemission userPemission = new UserPemission(user.getUserId());
                request.setAttribute("permission", userPemission);
                request.getRequestDispatcher("/Truysuatdonhang.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Bạn không có quền truy cập vào trang này");
                request.getRequestDispatcher("/getIndex").forward(request, response);
            }
        }
        else {
            response.sendRedirect("/DangNhap.jsp");
        }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
