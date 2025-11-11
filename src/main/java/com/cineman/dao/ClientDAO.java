package com.cineman.dao;

import com.cineman.model.Client;

import java.sql.*;

public class ClientDAO extends DAO {

    public ClientDAO() {
        super();
    }

    public Client getClientById(int clientId) {
        String sql = "SELECT c.*, m.* FROM client c " +
                     "INNER JOIN member m ON c.clientId = m.id " +
                     "WHERE c.clientId = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, clientId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Client client = new Client();
                    client.setClientId(rs.getInt("clientId"));
                    client.setEmail(rs.getString("email"));
                    client.setAddress(rs.getString("address"));
                    
                    client.setId(rs.getInt("id"));
                    client.setName(rs.getString("name"));
                    client.setBirthDate(rs.getDate("birthDate"));
                    client.setPhoneNumber(rs.getString("phoneNumber"));
                    client.setUsername(rs.getString("username"));
                    client.setPassword(rs.getString("password"));
                    client.setRole(rs.getString("role"));
                    
                    return client;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Client getClientByMemberId(int memberId) {
        String sql = "SELECT c.*, m.* FROM client c " +
                     "INNER JOIN member m ON c.clientId = m.id " +
                     "WHERE m.id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, memberId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Client client = new Client();
                    client.setClientId(rs.getInt("clientId"));
                    client.setEmail(rs.getString("email"));
                    client.setAddress(rs.getString("address"));
                    
                    client.setId(rs.getInt("id"));
                    client.setName(rs.getString("name"));
                    client.setBirthDate(rs.getDate("birthDate"));
                    client.setPhoneNumber(rs.getString("phoneNumber"));
                    client.setUsername(rs.getString("username"));
                    client.setPassword(rs.getString("password"));
                    client.setRole(rs.getString("role"));
                    
                    return client;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
