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
public class HistoryDAO implements Serializable {

    public boolean add_begin_date(String host, String fullName, String room, String username) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate currentDate = LocalDate.now();
        String start_date = currentDate.format(formatter);
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "INSERT INTO renters_history(host, fullName, room, start_date, username) "
                        + "VALUES(?, ?, ?, ?, ?)";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host);
                stm.setString(2, fullName);
                stm.setString(3, room);
                stm.setString(4, start_date);
                stm.setString(5, username);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next()) {
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

    public boolean add_end_date(String username) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate currentDate = LocalDate.now();
        String end_date = currentDate.format(formatter);
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "UPDATE renters_history "
                        + "SET end_date = ? "
                        + "WHERE username = ?;";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, end_date);
                stm.setString(2, username);
                //4. Excute Query
                stm.executeUpdate();                //5. Process Result
//                if (rs.next()) {
//                    return true;
//                }
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

    public boolean remove_username(String username) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "UPDATE renters_history "
                        + "SET username = null "
                        + "WHERE username = ?;";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. Excute Query
                stm.executeUpdate();                //5. Process Result
//                if (rs.next()) {
//                    return true;
//                }
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

    public ArrayList<String> getHistory(String host, String room) throws ClassNotFoundException, SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<String> history = new ArrayList<String>();
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "SELECT start_date, end_date, fullName FROM renters_history "
                        + "WHERE host = ? AND room = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host);
                stm.setString(2, room);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String start_date = rs.getString("start_date");
                    String end_date = rs.getString("end_date");
                    String fullName = rs.getString("fullName");
                    if (end_date == null) {
                        end_date = "now";
                    }
                    String a = fullName + " : " + start_date + "->" + end_date;
                    history.add(a);
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
        return history;
    }
}
