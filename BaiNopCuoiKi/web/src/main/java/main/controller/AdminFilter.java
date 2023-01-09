package main.controller;
import main.bean.User;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter",urlPatterns = "/Admin/*")
public class AdminFilter implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session=req.getSession();
        if(session.getAttribute("auth")==null || ((User) session.getAttribute("auth")).getRole()<1){

            ((HttpServletResponse)response).sendRedirect("../getIndex");
            session.setAttribute("error", "Bạn không có quyền truy cập vào trang này");
        }else{
            chain.doFilter(request, response);
        }
    }
}