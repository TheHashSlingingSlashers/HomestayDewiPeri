package model;

/**
 * Created by ric on 20/02/17.
 */

public class Penyewa {
    private String id, nama, alamat, noTelp;
    private Sex jenisKelamin;
    private Makanan jenisMakanan;
    private boolean menginap;

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

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public String getNoTelp() {
        return noTelp;
    }

    public void setNoTelp(String noTelp) {
        this.noTelp = noTelp;
    }

    public Sex getJenisKelamin() {
        return jenisKelamin;
    }

    public void setJenisKelamin(String sex) {
        try {
            jenisKelamin = Sex.valueOf(sex);
        } catch (IllegalArgumentException e) {
            jenisKelamin = null;
        }
    }

    public void setJenisKelamin(Sex jenisKelamin) {
        this.jenisKelamin = jenisKelamin;
    }

    public Makanan getJenisMakanan() {
        return jenisMakanan;
    }

    public void setJenisMakanan(Makanan jenisMakanan) {
        this.jenisMakanan = jenisMakanan;
    }

    public boolean isMenginap() {
        return menginap;
    }

    public void setMenginap(boolean menginap) {
        this.menginap = menginap;
    }

    public void setJenisMakanan(String jenis) {
        try{
            jenisMakanan = Makanan.valueOf(jenis);
        }catch (IllegalArgumentException e){
            jenisMakanan = null;
        }
    }

    public enum Sex {L, P}

    public enum Makanan {vege, nonvege}

}
