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
@WebServlet(urlPatterns = "/InsertEvent", name="InsertEvent")
public class InsertEvent extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("kodeEvent");
        String nama = request.getParameter("namaEvent");
        String penyelenggara = request.getParameter("penyelenggara");
        String mulai = request.getParameter("single_cal3");
        String selesai = request.getParameter("single_cal2");
               
        System.out.println(id);
        System.out.println(nama);
        System.out.println(penyelenggara);
        System.out.println(mulai);
        System.out.println(selesai);
    }
    
}
