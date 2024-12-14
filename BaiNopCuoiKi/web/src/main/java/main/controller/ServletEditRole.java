package main.controller;

import main.bean.Log;
import main.bean.User;
import main.bean.UserPemission;
import main.services.UsrPerServiece;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletEditRole", value = "/ServletEditRole")
public class ServletEditRole extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("auth")!=null) {
            User user = (User) session.getAttribute("auth");
//        Log.getInstance().WriteLog(user.getUserId(),1,this.getClass().getName(),"a","a");
            String roleId = request.getParameter("Role");
            String targetID = (String) request.getParameter("targetUID");
            UsrPerServiece.getInstance().upDaterole(roleId, targetID);
            int level = 3;
            String user0 = user.getUserName();
            String source = "Chỉnh role người dùng";
            String content = "Chỉnh role của ID "+targetID;
            String status = "Hoàn thành";
            Log.writeLog(level, user0, source, content, status);
            request.setAttribute("auth",user);
            request.setAttribute("targetUID",targetID);
            request.getRequestDispatcher("/ServletGetInforDB").forward(request, response);
        }
        else response.sendRedirect("./404ne.html");
    }
}
