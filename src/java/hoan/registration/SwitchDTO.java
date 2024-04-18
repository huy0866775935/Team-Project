/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hoan.registration;

/**
 *
 * @author Mr Viet
 */
public class SwitchDTO {
    String fullName;
    String room;
    String username;
  
    public String getUsername(){
        return username;
    }
    public void setUsername(String username){
        this.username = username;
    }
    
    
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public SwitchDTO(String fullName, String room, String username) {
        this.fullName = fullName;
        this.room = room;
        this.username= username;
    }
}
