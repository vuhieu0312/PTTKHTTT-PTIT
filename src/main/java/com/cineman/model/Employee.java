package com.cineman.model;

import java.util.*;

public class Employee extends Member {
    private int employeeId;
    private Date hireDate;
    private double salary;
    private String position;

    public Employee() {
        super();
    }

    public Employee(int employeeId, Date hireDate, double salary, String position) {
        super();
        this.employeeId = employeeId;
        this.hireDate = hireDate;
        this.salary = salary;
        this.position = position;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public Date getHireDate() {
        return hireDate;
    }

    public void setHireDate(Date hireDate) {
        this.hireDate = hireDate;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public boolean isManager() {
        return "MANAGER".equalsIgnoreCase(position);
    }
}
