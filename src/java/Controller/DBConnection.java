/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 *
 * @author Kasih Handoyo
 */
public class DBConnection {
//    public static void main(String[] args) {
//        DBConnection conn = new DBConnection();
//    }
    
    //    String jdbcURL = "jdbc:oracle:thin:@172.23.9.185:1521:orcl";
//    String user = "mhs135314075";
//    String password = "mhs135314075";
//    String jdbcURL = "jdbc:oracle:thin:@localhost:1521:xe";
//    String user = "hr";
//    String password = "kasihhandoyo";
//    public Connection connection = null;
    
    private String jdbcURL = "jdbc:mysql://127.0.0.1:3306/pentingsari";
    private String user = "root";
    private String password = "root";
    private Connection connection = null;

    public DBConnection() {
//        try {
//            Class.forName("oracle.jdbc.driver.OracleDriver");
//            connection = DriverManager.getConnection(jdbcURL, user, password);
//            System.out.println("konek");
//        } catch (Exception ex) {
//            System.out.println(ex.getMessage());
//        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, user, password);
            //System.out.println("konek");
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }
    }

    public boolean isConnected() {
        return connection != null;
    }

    public boolean getClosed() {
        if (isConnected()) {
            try {
                connection.close();
                connection = null;
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return true;
        } else {
            return false;
        }
    }

    public String getJdbcURL() {
        return jdbcURL;
    }

    public void setJdbcURL(String jdbcURL) {
        this.jdbcURL = jdbcURL;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Connection getConnection() {
        return connection;
    }

    public void setConn(Connection connection) {
        this.connection = connection;
    }
}
