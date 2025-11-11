package com.cineman.dao;

import com.cineman.model.ClientStatistic;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

public class ClientStatisticDAO extends DAO {

    public ClientStatisticDAO() {
        super();
    }
    public List<ClientStatistic> getClientRevenueStatistic(LocalDateTime startDate, LocalDateTime endDate) {
        List<ClientStatistic> statistics = new ArrayList<>();
        String sql = "SELECT c.ClientId, m.name, m.phoneNumber, SUM(b.totalPrice) as totalRevenue " +
                     "FROM bill b " +
                     "JOIN client c ON b.ClientId = c.ClientId " +
                     "JOIN member m ON c.ClientId = m.id " +
                     "WHERE b.createDate BETWEEN ? AND ? " +
                     "GROUP BY c.ClientId, m.name, m.phoneNumber " +
                     "ORDER BY totalRevenue DESC";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setTimestamp(1, Timestamp.valueOf(startDate));
            ps.setTimestamp(2, Timestamp.valueOf(endDate));
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ClientStatistic stat = new ClientStatistic();
                    stat.setClientId(rs.getInt("ClientId"));
                    stat.setTotalRevenue(rs.getDouble("totalRevenue"));

                    stat.setName(rs.getString("name"));
                    stat.setPhoneNumber(rs.getString("phoneNumber"));
                    
                    statistics.add(stat);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return statistics;
    }
}
