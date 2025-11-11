package com.cineman.model;

import java.util.*;

public class Bill {
    private int id;
    private double totalPrice;
    private Date createDate;
    private List<Ticket> tickets;
    private Employee employee;
    private Client client;

    public Bill() {
        this.tickets = new ArrayList<>();
    }

    public Bill(int id, double totalPrice, Date createDate) {
        this.id = id;
        this.totalPrice = totalPrice;
        this.createDate = createDate;
        this.tickets = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public List<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(List<Ticket> tickets) {
        this.tickets = tickets;
    }

    public void addTicket(Ticket ticket) {
        this.tickets.add(ticket);
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}

