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
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

/**
 *
 * @author Mr Viet
 */
public class MessageDAO implements Serializable {

    public void add_message_host(String username, String message) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate currentDate = LocalDate.now();
        String date = currentDate.format(formatter);
        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "INSERT INTO host_message (username, message, date) "
                        + "VALUES(?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, message);
                stm.setString(3, date);
                stm.executeUpdate();

            }
        } finally {

        }

    }

    public ArrayList<String> get_message_host(String username) throws SQLException, ClassNotFoundException {
        ArrayList<String> ms = new ArrayList<String>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select message, date "
                        + "FROM host_message "
                        + "WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String message = rs.getString("message");
                    String date = rs.getString("date");

                    ms.add(date + " : " + message);

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

        return ms;

    }

    public void add_message_renter(String room, String host, String message) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate currentDate = LocalDate.now();
        String date = currentDate.format(formatter);
        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "INSERT INTO renter_message (room, host, message, date) "
                        + "VALUES(?, ?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, room);
                stm.setString(2, host);
                stm.setString(3, message);
                stm.setString(4, date);
                stm.executeUpdate();

            }
        } finally {

        }

    }

    public ArrayList<String> get_message_renter(String host, String room) throws SQLException, ClassNotFoundException {
        ArrayList<String> ms = new ArrayList<String>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select message, date "
                        + "FROM renter_message "
                        + "WHERE host = ? and room = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host);
                stm.setString(2, room);

                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String message = rs.getString("message");
                    String date = rs.getString("date");

                    ms.add(date + " : " + message);

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

        return ms;

    }
}
