package com.cineman.servlet;

import com.cineman.dao.ClientStatisticDAO;
import com.cineman.model.ClientStatistic;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/clientstatistic")
public class ClientStatisticServlet extends HttpServlet {
    private ClientStatisticDAO clientStatisticDAO;

    @Override
    public void init() {
        clientStatisticDAO = new ClientStatisticDAO();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        
        if (startDateStr != null && !startDateStr.isEmpty() && 
            endDateStr != null && !endDateStr.isEmpty()) {
            try {
                LocalDateTime start = LocalDateTime.parse(startDateStr + "T00:00:00");
                LocalDateTime end = LocalDateTime.parse(endDateStr + "T23:59:59");
                
                List<ClientStatistic> statistics = clientStatisticDAO.getClientRevenueStatistic(start, end);
                
                request.setAttribute("ListClientStatistic", statistics);
                request.setAttribute("startDate", startDateStr);
                request.setAttribute("endDate", endDateStr);
                
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi khi tải thống kê!");
            }
        }
        request.getRequestDispatcher("/WEB-INF/jsp/ClientStatisticFrm.jsp").forward(request, response);
    }
}
