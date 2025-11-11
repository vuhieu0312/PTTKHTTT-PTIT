package com.cineman.model;

public class ClientStatistic extends Client {
    private double totalRevenue;

    public ClientStatistic() {
        super();
    }

    public ClientStatistic(double totalRevenue) {
        super();
        this.totalRevenue = totalRevenue;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }
}
