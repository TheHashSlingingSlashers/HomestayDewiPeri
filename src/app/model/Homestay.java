package app.model;

/**
 * Created by ric on 20/02/17.
 */
public class Homestay {
    private String id,pemilik,lokasi;
    private int jumlahKamar,jumlahBed, jumlahWC;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPemilik() {
        return pemilik;
    }

    public void setPemilik(String pemilik) {
        this.pemilik = pemilik;
    }

    public String getLokasi() {
        return lokasi;
    }

    public void setLokasi(String lokasi) {
        this.lokasi = lokasi;
    }

    public int getJumlahKamar() {
        return jumlahKamar;
    }

    public void setJumlahKamar(int jumlahKamar) {
        this.jumlahKamar = jumlahKamar;
    }

    public int getJumlahBed() {
        return jumlahBed;
    }

    public void setJumlahBed(int jumlahBed) {
        this.jumlahBed = jumlahBed;
    }

    public int getJumlahWC() {
        return jumlahWC;
    }

    public void setJumlahWC(int jumlahWC) {
        this.jumlahWC = jumlahWC;
    }
}
