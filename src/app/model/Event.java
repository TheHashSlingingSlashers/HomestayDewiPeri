package app.model;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by ric on 06/03/17.
 */
public class Event {
    private String id, nama, penyelenggara;
    private Date mulai, selesai;
    private static final DateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getPenyelenggara() {
        return penyelenggara;
    }

    public void setPenyelenggara(String penyelenggara) {
        this.penyelenggara = penyelenggara;
    }

    public Date getMulai() {
        return mulai;
    }

    public void setMulai(String date) throws ParseException {
        setMulai(formatter.parse(date));
    }

    public void setMulai(Date mulai) {
        this.mulai = mulai;
    }

    public Date getSelesai() {
        return selesai;
    }

    public void setSelesai(Date selesai) {
        this.selesai = selesai;
    }

    public void setSelesai(String tgl) throws ParseException {
        setSelesai(formatter.parse(tgl));
    }
}
