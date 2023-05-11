package main.controller;

import main.bean.User;
import main.services.ProductsService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddCommentServlet", value = "/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user  = (User) session.getAttribute("auth");


        String iduser = user.getIdacc();

        String idf = (String) session.getAttribute("fid2");
        String text = request.getParameter("cmt");
        ProductsService.getInstance().addComment(idf,iduser,text);

        response.sendRedirect("detail");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
