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
public class PenyewaDAO {
    public static final Comparator<Penyewa> SORT_BY_ID = new Comparator<Penyewa>() {
        @Override
        public int compare(Penyewa o1, Penyewa o2) {
            return o1.getId().compareTo(o2.getId());
        }
    };
    public static final Comparator<Penyewa> SORT_BY_NAME = new Comparator<Penyewa>() {
        @Override
        public int compare(Penyewa o1, Penyewa o2) {
            return o1.getNama().compareTo(o2.getNama());
        }
    };
    public static final String COLUMN_ID = "id";

    private PenyewaDAO() {
    }

    public static List<Penyewa> getAll() throws SQLException {
        List<Penyewa> res = new ArrayList<>();
        try (Statement st = DbStarter.getConnection().createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM penyewa");) {
            while (rs.next()) {
                Penyewa p = new Penyewa();
                p.setId(rs.getString(COLUMN_ID));
                p.setNama(rs.getString("nama"));
                p.setAlamat(rs.getString("alamat"));
                p.setJenisKelamin(rs.getString("jns_kelamin"));
                p.setJenisMakanan(rs.getString("jns_makanan"));
                p.setNoTelp(rs.getString("no_telp"));
                p.setMenginap(rs.getBoolean("menginap"));
                res.add(p);
            }
        } catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }

    public static List<Penyewa> getAllSortedBy(Comparator<Penyewa> sorter) throws SQLException {
        List<Penyewa> res = getAll();
        Collections.sort(res, sorter != null ? sorter : SORT_BY_ID);
        return res;
    }

    public static Penyewa getById(String id) throws SQLException {
        final String query = "SELECT * FROM penyewa WHERE id=?";
        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(query)) {
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Penyewa p = new Penyewa();
                p.setId(rs.getString(COLUMN_ID));
                p.setNama(rs.getString("nama"));
                p.setAlamat(rs.getString("alamat"));
                p.setJenisKelamin(rs.getString("jns_kelamin"));
                p.setJenisMakanan(rs.getString("jns_makanan"));
                p.setNoTelp(rs.getString("no_telp"));
                p.setMenginap(rs.getBoolean("menginap"));
                return p;
            }
        } catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static int insert(Penyewa p) throws SQLException {
        String sql = "INSERT INTO penyewa(id,nama,JNS_KELAMIN,ALAMAT,NO_TELP,JNS_MAKANAN,MENGINAP) VALUES (?,?,?,?,?,?,?)";
        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(sql)) {
            ps.setString(1, p.getId());
            ps.setString(2, p.getNama());
            ps.setString(3, p.getJenisKelamin().name());
            ps.setString(4, p.getAlamat());
            ps.setString(5, p.getNoTelp());
            ps.setString(6, p.getJenisMakanan().name());
            ps.setBoolean(7, p.isMenginap());
            return ps.executeUpdate();
        } catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }
    public static int insertAll(Collection<Penyewa> data) throws SQLException{
        int r=0;
        for (Penyewa p :data) {
            r+=insert(p);
        }
        return r;
    }
    public static int deleteById(String id) throws SQLException {
        final String query = "delete FROM penyewa WHERE id=?";
        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(query)) {
            ps.setString(1, id);
            return ps.executeUpdate();
        }catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            e.printStackTrace();
            return -0;
        }
    }
}
