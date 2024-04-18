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
public class change_roomDAO implements Serializable {

    public boolean add_request(String room1, String room2, String host, String renter) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "INSERT INTO change_room_request (host, renter, from_from, to_room) "
                        + "VALUES(?, ?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, host);
                stm.setString(2, renter);
                stm.setString(3, room1);
                stm.setString(4, room2);

                if (stm.executeUpdate() > 0) {
                    return true;
                }

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
        return false;
    }

    public ArrayList<change_roomDTO> get_all_request(String host) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        change_roomDTO request;
        ArrayList<change_roomDTO> requests = new ArrayList<change_roomDTO>();

        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select * "
                        + "FROM change_room_request "
                        + "WHERE host = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String renter = rs.getString("renter");
                    String from_from = rs.getString("from_from");
                    String to_room = rs.getString("to_room");
                    Boolean host_response = rs.getBoolean("host_response");
                   
                    request = new change_roomDTO(from_from, to_room, host, renter, host_response);
                    requests.add(request);
                    
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
        return requests;

    }
    
    public void delete_request(String renter) throws SQLException, ClassNotFoundException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
         try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "DELETE "
                        + "FROM change_room_request "
                        + "WHERE renter = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, renter);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                // end traverse ResultSet
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
    
    public void change_room(String renter, String room) throws SQLException, ClassNotFoundException{
         Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
         try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "UPDATE renter "
                        + "SET room = ? "
                        + "WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, room);
                stm.setString(2, renter);
                //4. Excute Query
                 stm.executeUpdate();
                //5. Process Result
                // end traverse ResultSet
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
