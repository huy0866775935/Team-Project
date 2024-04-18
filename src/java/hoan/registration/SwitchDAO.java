/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package hoan.registration;

import hoan.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Mr Viet
 */
public class SwitchDAO implements Serializable{
    public ArrayList<SwitchDTO> get_people_in_bulding(String room, String host) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<SwitchDTO> people = new ArrayList<SwitchDTO>();
        SwitchDTO s;
        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select fullName, room, username "
                        + "FROM renter "
                        + "WHERE host = ? and room != ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host);
                stm.setString(2, room);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String room1 = rs.getString("room");
                    String username = rs.getString("username");
                    s = new SwitchDTO(fullName, room1, username);

                    people.add(s);
                }// end traverse ResultSet
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return people;
        
    }
    
    public void add_request(String room1, String username1, String room2, String username2, String host) throws ClassNotFoundException, SQLException{
         Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "INSERT INTO switch_room_request (room1, username1, room2, username2, host) "
                        + "VALUES(?, ?, ?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, room1);
                stm.setString(2, username1);
                stm.setString(3, room2);
                stm.setString(4, username2);
                stm.setString(5, host);

                stm.executeUpdate();
                    
                

            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        
    }
    
    public ArrayList<RequestDTO> get_request(String host) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<RequestDTO> request = new ArrayList<RequestDTO>();
       
        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select username1, username2 "
                        + "FROM switch_room_request "
                        + "WHERE host = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host);
               
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String username1 = rs.getString("username1");
                    String username2 = rs.getString("username2");
                    RequestDTO r = new RequestDTO((username1), username2);

                    request.add(r);
                }// end traverse ResultSet
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return request;
    }
    
    public void delete_request(String username1,String username2, String host) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "DELETE FROM switch_room_request "
                        + "WHERE username1 = ? and username2 = ? and host = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username1);
                stm.setString(2, username2);
                stm.setString(3, host);

                //4. Excute Query
                stm.executeUpdate();
                //5. Process Result
                
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }

      
    }
}
