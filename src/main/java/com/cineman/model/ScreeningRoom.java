package com.cineman.model;

import java.util.*;

public class ScreeningRoom {
    private int id;
    private String name;
    private int seatCount;
    private List<Seat> seats;

    public ScreeningRoom() {
        this.seats = new ArrayList<>();
    }

    public ScreeningRoom(int id, String name, int seatCount) {
        this.id = id;
        this.name = name;
        this.seatCount = seatCount;
        this.seats = new ArrayList<>();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(int seatCount) {
        this.seatCount = seatCount;
    }

    public List<Seat> getSeats() {
        return seats;
    }

    public void setSeats(List<Seat> seats) {
        this.seats = seats;
    }

    @Override
    public String toString() {
        return "ScreeningRoom{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", seatCount=" + seatCount +
                '}';
    }
}
