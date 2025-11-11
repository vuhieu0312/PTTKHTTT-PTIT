package com.cineman.servlet;

import com.cineman.dao.MemberDAO;
import com.cineman.model.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private MemberDAO memberDAO;

    @Override
    public void init() {
        memberDAO = new MemberDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/jsp/LoginFrm.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username == null || username.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin!");
            request.getRequestDispatcher("/WEB-INF/jsp/LoginFrm.jsp").forward(request, response);
            return;
        }

        // Check login - Tất cả logic xử lý nằm trong MemberDAO.checkLogin()
        Member member = memberDAO.checkLogin(username, password);

        if (member != null) {
            // Đăng nhập thành công - Set session attributes
            HttpSession session = request.getSession();
            session.setAttribute("user", member);
            session.setAttribute("userId", member.getId());
            session.setAttribute("username", member.getUsername());
            session.setAttribute("role", member.getRole());

            // Xác định redirect URL dựa trên object type
            String redirectUrl = "/client-home"; // Default
            
            // Nếu là employee (Employee extends Member), set thêm employee và position
            if (member instanceof com.cineman.model.Employee) {
                com.cineman.model.Employee employee = (com.cineman.model.Employee) member;
                session.setAttribute("employee", employee);
                session.setAttribute("position", employee.getPosition());
                
                // Manager -> trang quản lý, còn lại -> trang client
                if (employee.isManager()) {
                    redirectUrl = "/manager-home";
                }
            }

            // Redirect
            response.sendRedirect(request.getContextPath() + redirectUrl);
            
        } else {
            // Đăng nhập thất bại
            request.setAttribute("error", "Tên đăng nhập hoặc mật khẩu không đúng!");
            request.setAttribute("username", username);
            request.getRequestDispatcher("/WEB-INF/jsp/LoginFrm.jsp").forward(request, response);
        }
    }
}
