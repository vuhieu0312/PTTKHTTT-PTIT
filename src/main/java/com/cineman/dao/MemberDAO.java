package com.cineman.dao;

import com.cineman.model.Member;
import com.cineman.model.Employee;
import com.cineman.model.Client;

import java.sql.*;
import java.util.*;

public class MemberDAO extends DAO {

    public MemberDAO() {
        super();
    }
    public Member checkLogin(String username, String password) {
        String sql = "SELECT * FROM member WHERE username = ? AND password = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int memberId = rs.getInt("id");
                    String role = rs.getString("role");

                    if ("EMPLOYEE".equalsIgnoreCase(role)) {
                        Employee employee = getEmployeeByMemberId(memberId);
                        if (employee != null) {
                            return employee;
                        }
                        
                    } else if ("CLIENT".equalsIgnoreCase(role)) {
                        ClientDAO clientDAO = new ClientDAO();
                        Client client = clientDAO.getClientByMemberId(memberId);
                        if (client != null) {
                            return client;
                        }
                    }

                    Member member = new Member();
                    member.setId(memberId);
                    member.setName(rs.getString("name"));
                    member.setBirthDate(rs.getDate("birthDate"));
                    member.setPhoneNumber(rs.getString("phoneNumber"));
                    member.setUsername(rs.getString("username"));
                    member.setPassword(rs.getString("password"));
                    member.setRole(role);
                    return member;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Employee getEmployeeByMemberId(int memberId) {
        String sql = "SELECT e.*, m.* FROM employee e " +
                     "INNER JOIN member m ON e.EmployeeId = m.id " +
                     "WHERE m.id = ?";
        
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, memberId);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Employee employee = new Employee();

                    employee.setEmployeeId(rs.getInt("EmployeeId"));
                    employee.setHireDate(rs.getDate("hireDate"));
                    employee.setSalary(rs.getDouble("salary"));
                    employee.setPosition(rs.getString("position"));
                    

                    employee.setId(rs.getInt("id"));
                    employee.setName(rs.getString("name"));
                    employee.setBirthDate(rs.getDate("birthDate"));
                    employee.setPhoneNumber(rs.getString("phoneNumber"));
                    employee.setUsername(rs.getString("username"));
                    employee.setPassword(rs.getString("password"));
                    employee.setRole(rs.getString("role"));
                    
                    return employee;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }


}
