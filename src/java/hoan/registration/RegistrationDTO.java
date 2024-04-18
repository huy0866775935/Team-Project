/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoan.registration;

import java.io.Serializable;
// object cho host
/**
 *
 * @author 
 */
public class RegistrationDTO implements Serializable{
    private String username;
    private String password;
    private String fullName;
    private boolean role;
    private int so_tang;
    private int so_phong;
    private int max;

    public RegistrationDTO() {
    }

    public RegistrationDTO(String username, String password, String fullName, boolean role, int so_tang, int so_phong, int max) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.role = role;
        this.so_tang = so_tang;
        this.so_phong = so_phong;
        this.max = max;
    }
    
    public int getMax(){
        return max;
    }
    
    public void setMax(int max){
        this.max = max;
    }
    
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    public int getSo_tang() {
        return so_tang;
    }

    public void setSo_tang(int so_tang) {
        this.so_tang = so_tang;
    }

    public int getSo_phong() {
        return so_phong;
    }

    public void setSo_phong(int so_phong) {
        this.so_phong = so_phong;
    }

   
    
}
