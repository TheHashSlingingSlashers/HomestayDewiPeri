/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kasih Handoyo
 */
public class loginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            ResultSet res = loginUser(username, password);
            if (res.next()) {
                if (res.getString("role").equals("S")) {
                    response.sendRedirect("index.jsp");
                } else {
                    response.sendRedirect("index.jsp");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(loginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static ResultSet loginUser(String username, String passwd) throws SQLException {
        DBConnection db = new DBConnection();
        Connection c = db.getConnection();
        String query = "select * from pengguna where username = '"+username +"' "
                + "and password = '"+passwd+"'";
        Statement stmt = c.createStatement();
        return stmt.executeQuery(query);
    }
}
