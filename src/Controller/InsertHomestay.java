/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kasih Handoyo
 */
@WebServlet(urlPatterns = "/InsertHomestay", name="InsertHomestay")
public class InsertHomestay extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("kodeHomestay");
        String pemilik = request.getParameter("namaPemilik");
        String lokasi = request.getParameter("lokasi");
        String jmlKamar = request.getParameter("jumlahKamar");
        String jmlBed = request.getParameter("jumlahTempatTidur");
        String jmlWc = request.getParameter("jumlahToilet");
        
        System.out.println(id);
        System.out.println(pemilik);
        System.out.println(lokasi);
        System.out.println(jmlKamar);
        System.out.println(jmlBed);
        System.out.println(jmlWc);
        
    }
}
