package main.controller;

import main.bean.*;
import main.services.AppService;
import main.services.OderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletAcceptOder", value = "/ServletAcceptOder")
public class ServletAcceptOder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user!=null) {
            int role = user.getRole();
            if (AppService.checkAdmin(role)) {
                UserPemission actor = new UserPemission(user.getUserId());
                if (actor.canEditAddTran()) {
                OderService.getInstance().AcceptlOder(request.getParameter("idoder"));
                Order order = OderService.getInstance().getInforOder(request.getParameter("idoder"));
                ApiController controller = new ApiController();
                ArrayList<Order> oder = OderService.getInstance().getAllOder();
                request.setAttribute("alloder", oder);
                UserPemission userPemission = new UserPemission(user.getUserId());
                request.setAttribute("permission", userPemission);
                controller.saveOder(order);
                    int level = 0;
                    String user0 = user.getUserName();
                    String source = "ServletAcceptOder";
                    String content = "Chấp nhận oder";
                    String status = "Hoàn thành";
                    Log.writeLog(level, user0, source, content, status);
                request.getRequestDispatcher("/ServletGetAllOder").forward(request, response);
                }else {
                    response.sendRedirect("./404Page.html");}
            } else {
                response.sendRedirect("./404Page.html");
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
