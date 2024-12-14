package main.controller;

import main.bean.*;
import main.services.AddOderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletResetFormoder", value = "/ServletResetFormoder")
public class ServletResetFormoder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
       int stage = Integer.parseInt(request.getParameter("stage")) ;
       if (stage==0) {
           ApiController control = new ApiController();
           request.setAttribute("listdiachi1", control.getDistrictbyPvID("202"));
           ArrayList<APIwardRespone.data> rs = control.getWardbyDTid(request.getParameter("diachi1").toString());
           request.setAttribute("listdiachi2", rs);
           request.setAttribute("stage",1);
           request.getRequestDispatcher("/GioHang.jsp").forward(request, response);
       }
       if (stage==1){

           User user = (User) session.getAttribute("auth");
           Cart cart = (Cart) session.getAttribute("cart");
           String adrs1 = request.getParameter("diachi1");
           String adrs2 = request.getParameter("diachi2");
           String vouch = (String) request.getParameter("voucher");
           if (user!=null) {

               if (AddOderService.getInstance().adODer(user.getIdacc(), cart, vouch,adrs1,adrs2)) {
                   request.setAttribute("error", "Thanh toán thành công");
                   session.setAttribute("cart", new Cart());
                   request.getRequestDispatcher("./yah.html").forward(request, response);

               } else {
                   request.setAttribute("error", "Thanh toán thất bại");
                   response.sendRedirect("./404ne.html");
               }
           }else{
               request.setAttribute("error", "Vui lòng đang nhập để thanh toán");
               request.getRequestDispatcher("./getIndex").forward(request, response);
           }
       }
    }
}
