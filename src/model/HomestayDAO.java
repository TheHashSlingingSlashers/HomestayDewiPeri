package model;

import util.DbStarter;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

/**
 * Created by ric on 20/02/17.
 */
public class HomestayDAO {
    private HomestayDAO() {
    }

    public static final Comparator<Homestay> SORT_BY_ID = new Comparator<Homestay>() {
        @Override
        public int compare(Homestay o1, Homestay o2) {
            return o1.getId().compareTo(o2.getId());
        }
    };

    public static List<Homestay> getAll() throws SQLException {
        List<Homestay> res = new ArrayList<>();
        try (Statement st = DbStarter.getConnection().createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM homestay");) {
            while (rs.next()) {
                Homestay h = new Homestay();
                h.setId(rs.getString("id"));
                h.setPemilik(rs.getString("pemilik"));
                h.setLokasi(rs.getString("lokasi"));
                h.setJumlahKamar(rs.getInt("jml_kamar"));
                h.setJumlahBed(rs.getInt("jml_bed"));
                h.setJumlahWC(rs.getInt("jml_wc"));
                res.add(h);
            }
        }
        return res;
    }

    public static List<Homestay> getAllSortedBy(Comparator<Homestay> sorter) throws SQLException {
        List<Homestay> res = getAll();
        Collections.sort(res, sorter != null ? sorter : SORT_BY_ID);
        return res;
    }

    public static Homestay getById(String id) throws SQLException {
        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement("SELECT * FROM HOMESTAY WHERE id=?");) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Homestay h = new Homestay();
                h.setId(rs.getString("id"));
                h.setPemilik(rs.getString("pemilik"));
                h.setLokasi(rs.getString("lokasi"));
                h.setJumlahKamar(rs.getInt("jml_kamar"));
                h.setJumlahBed(rs.getInt("jml_bed"));
                h.setJumlahWC(rs.getInt("jml_wc"));
                return h;
            }
        }
        return null;
    }

    public static int insert(Homestay h) throws SQLException {
        String sql = "INSERT INTO HOMESTAY(id,pemilik,LOKASI,JML_KAMAR,JML_BED,JML_WC) VALUES (?,?,?,?,?,?)";
        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(sql)) {
            ps.setString(1, h.getId());
            ps.setString(2, h.getPemilik());
            ps.setString(3, h.getLokasi());
            ps.setInt(4, h.getJumlahKamar());
            ps.setInt(5, h.getJumlahBed());
            ps.setInt(6, h.getJumlahWC());
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public static final int insertAll(Collection<Homestay> data) throws SQLException {
        int r=0;
        for (Homestay h : data) {
            r+=insert(h);
        }
        return r;
    }
    public static final int deleteById(String id)throws SQLException{
        String sql="DELETE FROM HOMESTAY WHERE id=?";
        try (PreparedStatement ps=DbStarter.getConnection().prepareStatement(sql)){
            ps.setString(1, id);
            return ps.executeUpdate();
        }catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
}
