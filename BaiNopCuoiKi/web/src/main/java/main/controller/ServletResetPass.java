package main.controller;

import main.bean.Log;
import main.bean.User;
import main.services.Utils;
import main.services.useService;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Properties;

@WebServlet(name = "ServletResetPass", value = "/ServletResetPass")
public class ServletResetPass extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String smail = request.getParameter("email");
        HttpSession session = request.getSession();

        if (smail != null && smail!="") {
            String ID_ACCOUNT = "";

            ID_ACCOUNT = useService.getInstance().getIDfromEmail(smail);
            if(ID_ACCOUNT!=null) {
                long intime = System.currentTimeMillis();
            int rand_num = (int) (Math.random() * 1000000);
            String rand = Integer.toString(rand_num);
            String finale = (rand + "" + intime); //
            String hash;
            try {
                hash = Utils.getInstance().getHashPass(finale);
            } catch (NoSuchAlgorithmException e) {
                throw new RuntimeException(e);
            }
            int saved = useService.getInstance().upReset_password(ID_ACCOUNT, hash);
            String link = null;
            link = request.getRequestURL().toString().replace("ServletResetPass", "reset_password") + "?hash=" + hash;


            String messageText = " Click <a href=" + link  + ">Here</a> To Reset your Password. You must reset your password within 20 minutes.";
            Utils.getInstance().sendMail(smail, "Đặt Lại Mật Khẩu", messageText);


            //-----------------------------------------------
            request.getRequestDispatcher("/DangNhap.jsp").forward(request, response);

        }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
