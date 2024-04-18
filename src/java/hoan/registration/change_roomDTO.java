/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hoan.registration;

/**
 *
 * @author Mr Viet
 */
public class change_roomDTO {
    private String room1, room2, host, renter;
    Boolean host_response;

    public String getRoom1() {
        return room1;
    }

    public void setRoom1(String room1) {
        this.room1 = room1;
    }

    public String getRoom2() {
        return room2;
    }

    public void setRoom2(String room2) {
        this.room2 = room2;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public String getRenter() {
        return renter;
    }

    public void setRenter(String renter) {
        this.renter = renter;
    }

    public Boolean getHost_response() {
        return host_response;
    }

    public void setHost_response(Boolean host_response) {
        this.host_response = host_response;
    }

    public change_roomDTO(String room1, String room2, String host, String renter, Boolean host_response) {
        this.room1 = room1;
        this.room2 = room2;
        this.host = host;
        this.renter = renter;
        this.host_response = host_response;
    }
}
