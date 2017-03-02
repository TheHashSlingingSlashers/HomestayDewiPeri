package app.repository;

import app.model.Penyewa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import util.DbStarter;

import java.sql.*;
import java.util.*;

/**
 * Created by ric on 20/02/17.
 */
@Repository
public class PenyewaDAO {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public PenyewaDAO(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public static final Comparator<Penyewa> SORT_BY_ID = Comparator.comparing(Penyewa::getId);
    public static final Comparator<Penyewa> SORT_BY_NAME = new Comparator<Penyewa>() {
        @Override
        public int compare(Penyewa o1, Penyewa o2) {
            return o1.getNama().compareTo(o2.getNama());
        }
    };
    public static final String COLUMN_ID = "id";

    private PenyewaDAO() {
    }

    public List<Penyewa> getAll() throws SQLException {
        return jdbcTemplate.query("SELECT * FROM penyewa", new RowMapper<Penyewa>() {
            @Override
            public Penyewa mapRow(ResultSet rs, int rowNum) throws SQLException {
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
        });
//                List < Penyewa > res = new ArrayList<>();
//        try (Statement st = DbStarter.getConnection().createStatement();
//             ResultSet rs = st.executeQuery("SELECT * FROM penyewa");) {
//            while (rs.next()) {
//                Penyewa p = new Penyewa();
//                p.setId(rs.getString(COLUMN_ID));
//                p.setNama(rs.getString("nama"));
//                p.setAlamat(rs.getString("alamat"));
//                p.setJenisKelamin(rs.getString("jns_kelamin"));
//                p.setJenisMakanan(rs.getString("jns_makanan"));
//                p.setNoTelp(rs.getString("no_telp"));
//                p.setMenginap(rs.getBoolean("menginap"));
//                res.add(p);
//            }
//        } catch (SQLException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return res;
    }

    public List<Penyewa> getAllSortedBy(Comparator<Penyewa> sorter) throws SQLException {
        List<Penyewa> res = getAll();
        Collections.sort(res, sorter != null ? sorter : SORT_BY_ID);
        return res;
    }

    public Penyewa getById(String id) throws SQLException {
        return jdbcTemplate.query("SELECT * FROM penyewa WHERE id=?", new String[]{id}, new int[]{Types.VARCHAR}, new ResultSetExtractor<Penyewa>() {
            @Override
            public Penyewa extractData(ResultSet rs) throws SQLException, DataAccessException {
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
                return null;
            }
        });
//        final String query = "SELECT * FROM penyewa WHERE id=?";
//        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(query)) {
//            ps.setString(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                Penyewa p = new Penyewa();
//                p.setId(rs.getString(COLUMN_ID));
//                p.setNama(rs.getString("nama"));
//                p.setAlamat(rs.getString("alamat"));
//                p.setJenisKelamin(rs.getString("jns_kelamin"));
//                p.setJenisMakanan(rs.getString("jns_makanan"));
//                p.setNoTelp(rs.getString("no_telp"));
//                p.setMenginap(rs.getBoolean("menginap"));
//                return p;
//            }
//        } catch (SQLException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
    }

    public int insert(Penyewa p) throws SQLException {
        String sql = "INSERT INTO penyewa(id,nama,JNS_KELAMIN,ALAMAT,NO_TELP,JNS_MAKANAN,MENGINAP) VALUES (?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, ps -> {
            ps.setString(1, p.getId());
            ps.setString(2, p.getNama());
            ps.setString(3, p.getJenisKelamin().name());
            ps.setString(4, p.getAlamat());
            ps.setString(5, p.getNoTelp());
            ps.setString(6, p.getJenisMakanan().name());
            ps.setBoolean(7, p.isMenginap());
        });
//        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(sql)) {
//            ps.setString(1, p.getId());
//            ps.setString(2, p.getNama());
//            ps.setString(3, p.getJenisKelamin().name());
//            ps.setString(4, p.getAlamat());
//            ps.setString(5, p.getNoTelp());
//            ps.setString(6, p.getJenisMakanan().name());
//            ps.setBoolean(7, p.isMenginap());
//            return ps.executeUpdate();
//        } catch (SQLException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return 0;
//        }
    }

    public int insertAll(Collection<Penyewa> data) throws SQLException {
        int r = 0;
        for (Penyewa p : data) {
            r += insert(p);
        }
        return r;
    }

    public int deleteById(String id) throws SQLException {
        final String query = "delete FROM penyewa WHERE id=?";
        return jdbcTemplate.update(query, new Object[]{id}, new int[]{Types.VARCHAR});
//        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(query)) {
//            ps.setString(1, id);
//            return ps.executeUpdate();
//        } catch (SQLException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return -0;
//        }
    }
}
