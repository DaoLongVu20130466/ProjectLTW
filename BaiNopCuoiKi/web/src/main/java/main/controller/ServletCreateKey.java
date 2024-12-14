package main.controller;

import main.bean.*;
import main.services.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.ArrayList;

@WebServlet(name = "ServletCreateKey", value = "/ServletCreateKey")
public class ServletCreateKey extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");
        if(user!=null) {
            try {
                String iduser = user.getUserId();
                User usernow = useService.getInstance().getAllUserByID(iduser);
                String a= usernow.getEmail();
                KeyPair kp =   RSA.getInstance().generateKeyPair();
                // PublicKey
                PublicKey publicKey = kp.getPublic();
                // PrivateKey
                PrivateKey privateKey = kp.getPrivate();
                String text = "-----BEGIN PRIVATE KEY-----"+"<BR>"+RSA.getInstance().encodePrivateKey(privateKey)+"<BR>"+"-----END PRIVATE KEY-----";
                Utils.getInstance().sendMail(a,"Private Key for You",text);
                String mess="Private key của bạn được gửi về EMail";
                request.setAttribute("message",mess);
                request.getRequestDispatcher("/key.jsp").forward(request, response);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
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
