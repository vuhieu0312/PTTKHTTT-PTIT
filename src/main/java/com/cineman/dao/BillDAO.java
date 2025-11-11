package com.cineman.dao;

import com.cineman.model.Bill;
import java.sql.*;
import java.util.*;


public class BillDAO extends DAO {

    public BillDAO() {
        super();
    }

    public List<Bill> getListBill(int clientId, java.time.LocalDateTime start, java.time.LocalDateTime end) {
        List<Bill> bills = new ArrayList<>();
        String sql = "SELECT * FROM bill WHERE ClientId = ? AND createDate BETWEEN ? AND ? ORDER BY createDate DESC";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, clientId);
            ps.setTimestamp(2, Timestamp.valueOf(start));
            ps.setTimestamp(3, Timestamp.valueOf(end));
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Bill bill = new Bill();
                    bill.setId(rs.getInt("id"));
                    bill.setTotalPrice(rs.getDouble("totalPrice"));
                    bill.setCreateDate(rs.getDate("createDate"));
                    bills.add(bill);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }
}
