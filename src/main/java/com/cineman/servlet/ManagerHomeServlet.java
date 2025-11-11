package com.cineman.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/manager-home")
public class ManagerHomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        String role = (String) session.getAttribute("role");
        String position = (String) session.getAttribute("position");
        
        if (!"MANAGER".equals(role) && !"Manager".equalsIgnoreCase(position)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
    request.getRequestDispatcher("/WEB-INF/jsp/ManagerHomeFrm.jsp").forward(request, response);
    }
}
