package com.cineman.model;

public class Client extends Member {
    private int clientId;
    private String address;
    private String email;

    public Client() {
        super();
    }

    public Client(int clientId, String address, String email) {
        super();
        this.clientId = clientId;
        this.address = address;
        this.email = email;
    }

    public int getClientId() {
        return clientId;
    }

    public void setClientId(int clientId) {
        this.clientId = clientId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
