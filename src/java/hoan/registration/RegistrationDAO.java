/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hoan.registration;

import hoan.utils.DBHelper;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Teacher
 */
public class RegistrationDAO implements Serializable {

    private List<RegistrationDTO> accounts;

    public boolean checkLogin_for_host(String username, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select username "
                        + "FROM Registration "
                        + "WHERE username = ? "
                        + "AND password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
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

    public boolean checkLogin_for_renter(String username, String password)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            con = DBHelper.makeConnection();
            if (con != null) {
                //2. Create SQL String
                String sql = "Select username "
                        + "FROM renter "
                        + "WHERE username = ? "
                        + "AND password = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
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

    public List<RegistrationDTO> getAccounts() {
        return accounts;
    }

    //lấy ra dữ liệu account từ database của renter qua username 
    public RenterDTO getAccount_for_renter(String username)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RenterDTO dto = null;
        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select username, password, fullname, room, host, role "
                        + "FROM renter "
                        + "WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    String room = rs.getString("room");
                    String host = rs.getString("host");
                    boolean role = rs.getBoolean("role");

                    dto = new RenterDTO(username, password, fullName, room, host, role);
                    return dto;
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
        return dto;
    }

    //lấy ra dữ liệu account từ database của host qua username 
    public RegistrationDTO getAccount_for_host(String username)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RegistrationDTO dto = null;
        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select username, password, fullname, role, so_tang, so_phong, max "
                        + "FROM Registration "
                        + "WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullname");
                    boolean role = rs.getBoolean("role");
                    int so_tang = rs.getInt("so_tang");
                    int so_phong = rs.getInt("so_phong");
                    int max = rs.getInt("max");
                    dto = new RegistrationDTO(username, password, fullName, role, so_tang, so_phong, max);
                    return dto;
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
        return dto;
    }

//them tk vào database của host
    public boolean addAccount_for_host(String username, String password, String fullName)
            throws SQLException, ClassNotFoundException {

        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "INSERT INTO Registration (username, password, fullname, role) "
                        + "VALUES(?, ?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, fullName);
                stm.setBoolean(4, true);

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

    //thêm tài khoản vào data base của renter
    public boolean addAccount_for_renter(String username, String password, String fullName, String room, String host)
            throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "INSERT INTO renter (username, password, fullName, room, host, role) "
                        + "VALUES(?, ?, ?, ?, ?, ?)";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                stm.setString(3, fullName);
                stm.setString(4, room);
                stm.setString(5, host);
                stm.setBoolean(6, false);

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

    //cập nhật số tầng và số phòng cho host
    public void update_for_host(String username, int floors, int rooms, int max) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;

        try {
            con = DBHelper.makeConnection();

            if (con != null) {
                String sql = "UPDATE Registration "
                        + "SET so_tang = ?, so_phong = ?, max= ? "
                        + "WHERE username = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, floors);
                stm.setInt(2, rooms);
                stm.setInt(3, max);
                stm.setString(4, username);
                stm.executeUpdate();
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }

    //lấy tất cả thông tin của renter thông của username của host
    public ArrayList<RenterDTO> get_renters_infor_by_host(String host_username) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        RenterDTO renter;
        ArrayList<RenterDTO> renters = new ArrayList<RenterDTO>();

        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "Select username, password, fullName, room, host, role "
                        + "FROM renter "
                        + "WHERE host = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host_username);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {
                    String username = rs.getString("username");
                    String password = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    String room = rs.getString("room");
                    String host = rs.getString("host");
                    boolean role = rs.getBoolean("role");

                    renter = new RenterDTO(username, password, fullName, room, host, role);
                    renters.add(renter);

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
        return renters;
    }

    public boolean delete_renter(String host_username) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "DELETE FROM renter "
                        + "WHERE username = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, host_username);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next()) {
                    return true;

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

        return false;
    }

    public ArrayList<String> get_roomate(String host, String room) throws SQLException, ClassNotFoundException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String roomate_name = "";
        ArrayList<String> roomate_names = new ArrayList<String>();
        
        try {
            //kết nối với database
            con = DBHelper.makeConnection();

            if (con != null) {
                //2. Create SQL String
                String sql = "SELECT fullName "
                        + "FROM renter "
                        + "WHERE room = ? AND host = ?";
                //3. Create Statement
                stm = con.prepareStatement(sql);
                stm.setString(1, room);
                stm.setString(2, host);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                while (rs.next()) {                 
                    roomate_name = rs.getString("fullName");
                    roomate_names.add(roomate_name);
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
        return roomate_names;

    }

}
