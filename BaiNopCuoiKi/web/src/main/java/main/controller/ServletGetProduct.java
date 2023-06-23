package main.controller;

import main.bean.Image;
import main.bean.Products;
import main.bean.User;
import main.services.ProductsService;
import main.services.useService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "getProduct", value = "/detail")
public class ServletGetProduct extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String fid = request.getParameter("fid");
        String type = request.getParameter("type");
        if (fid == null){
            fid = (String) session.getAttribute("fid2");
            type = (String) session.getAttribute("type2");
        }

        session.setAttribute("fid2", fid);
        session.setAttribute("type2", type);
        Products pro = ProductsService.getInstance().getProductByID(fid);
        ArrayList<Products> allProductByID = (ArrayList<Products>) ProductsService.getInstance().getAllProductByID(type);
        ArrayList<User> cmt = useService.getInstance().getComment(fid);
        ArrayList<Image> imageArrayList = ProductsService.getInstance().getImgEdit(fid);

        request.setAttribute("product", pro);
        request.setAttribute("allProductByID", allProductByID);
        request.setAttribute("cmt",cmt);
        request.setAttribute("imageArrayList",imageArrayList);

        request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
