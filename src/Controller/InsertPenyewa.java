/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kasih Handoyo
 */
@WebServlet(urlPatterns = "/InsertPenyewa", name="InsertPenyewa")
public class InsertPenyewa extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("noIdentitas");
        String nama = request.getParameter("nama");
        String sex = request.getParameter("sexRadio");
        String alamat = request.getParameter("alamat");
        String telepon = request.getParameter("telepon");
        String jnsMakanan = request.getParameter("foodRadio");
        String menginap = request.getParameter("menginap");
        
        System.out.println(id);
        System.out.println(nama);
        System.out.println(sex);
        System.out.println(alamat);
        System.out.println(telepon);
        System.out.println(jnsMakanan);
        System.out.println(menginap);
    }

}
