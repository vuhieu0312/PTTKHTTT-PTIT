package com.cineman.model;

import java.util.*;
public class MembershipCard {
    private int clientId;
    private Date createdAt;
    private String tier;

    public MembershipCard() {
    }

    public MembershipCard(int clientId, Date createdAt, String tier) {
        this.clientId = clientId;
        this.createdAt = createdAt;
        this.tier = tier;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public String getTier() {
        return tier;
    }

    public void setTier(String tier) {
        this.tier = tier;
    }

    @Override
    public String toString() {
        return "MembershipCard{" +
                "clientId=" + clientId +
                ", createdAt=" + createdAt +
                ", tier='" + tier + '\'' +
                '}';
    }
}
