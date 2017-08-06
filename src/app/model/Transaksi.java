package app.model;

public class Transaksi {
    private String idPenyewa;
    private String idHomestay;
    private String idEvent;

    public String getIdPenyewa() {
        return idPenyewa;
    }

    public void setIdPenyewa(String idPenyewa) {
        this.idPenyewa = idPenyewa;
    }

    public String getIdHomestay() {
        return idHomestay;
    }

    public void setIdHomestay(String idHomestay) {
        this.idHomestay = idHomestay;
    }

    public String getIdEvent() {
        return idEvent;
    }

    public void setIdEvent(String idEvent) {
        this.idEvent = idEvent;
    }
}
