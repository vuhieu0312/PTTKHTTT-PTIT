package com.cineman.servlet;

import com.cineman.dao.BillDAO;
import com.cineman.dao.ClientDAO;
import com.cineman.model.Bill;
import com.cineman.model.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@WebServlet("/bill")
public class BillServlet extends HttpServlet {
    private BillDAO billDAO;
    private ClientDAO clientDAO;

    @Override
    public void init() {
        billDAO = new BillDAO();
        clientDAO = new ClientDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String clientIdStr = request.getParameter("clientId");
        String startDateStr = request.getParameter("startDate");
        String endDateStr = request.getParameter("endDate");
        
        if (clientIdStr != null && startDateStr != null && endDateStr != null) {
            try {
                int clientId = Integer.parseInt(clientIdStr);
                
                LocalDateTime start = LocalDateTime.parse(startDateStr + "T00:00:00");
                LocalDateTime end = LocalDateTime.parse(endDateStr + "T23:59:59");
                
                Client client = clientDAO.getClientById(clientId);
                if (client != null) {
                    request.setAttribute("clientName", client.getName());
                }
                List<Bill> listBill = billDAO.getListBill(clientId, start, end);
                
                request.setAttribute("ListBill", listBill);
                request.setAttribute("clientId", clientId);
                
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("error", "Lỗi tải danh sách hóa đơn!");
            }
        }
        
        request.getRequestDispatcher("/WEB-INF/jsp/ClientStatisticDetailFrm.jsp").forward(request, response);
    }
}
