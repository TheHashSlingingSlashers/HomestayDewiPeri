/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kasih Handoyo
 */
public class addPenyewaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String noId = request.getParameter("noIdentitas");
        String nama = request.getParameter("nama");
        String sex = request.getParameter("sexRadio");
        String alamat = request.getParameter("alamat");
        String telp = request.getParameter("telepon");
        String jnsMakanan = request.getParameter("foodRadio");
        String keterangan = request.getParameter("infoRadio");
        
        System.out.println(noId);
        System.out.println(nama);
        System.out.println(sex);
        System.out.println(alamat);
        System.out.println(telp);
        System.out.println(jnsMakanan);
        System.out.println(keterangan);
    }
}
