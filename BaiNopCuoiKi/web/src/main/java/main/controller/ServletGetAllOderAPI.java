package main.controller;

import main.bean.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;

@WebServlet(name = "ServletGetAllOderAPI", value = "/ServletGetAllOderAPI")
public class ServletGetAllOderAPI extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        ApiController control = new ApiController();
        if(user!=null ) {
            UserPemission per = new UserPemission(user.getUserId());
            if(per.canWatchTran()){
            ApiAllOderReponse[] rs = control.getAllOder();
                for (ApiAllOderReponse info : rs) {
                    try {
                        info.update();
                    } catch (ParseException e) {
                        throw new RuntimeException(e);
                    }
                }
            request.setAttribute("alloderapi",rs);
            request.setAttribute("permission", per);
                int level = 2;
                String user0 = user.getUserName();
                String source = "ServletGetAllOderAPI";
                String content = "Xem đơn hàng đang giao";
                String status = "Hoàn thành";
                Log.writeLog(level, user0, source, content, status);
            request.getRequestDispatcher("/donhanggiao.jsp").forward(request, response);}
            else response.sendRedirect("/404Page.html");
        }
        else response.sendRedirect("/404Page.html");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
