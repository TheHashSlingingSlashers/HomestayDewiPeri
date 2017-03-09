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

import static java.sql.Types.BOOLEAN;
import static java.sql.Types.VARCHAR;

/**
 * Created by ric on 20/02/17.
 */
@Repository
public class PenyewaDAO extends DAO<Penyewa> {

    @Autowired
    public PenyewaDAO(JdbcTemplate jdbcTemplate) {
        super(jdbcTemplate);
    }

    public static final Comparator<Penyewa> SORT_BY_ID = Comparator.comparing(Penyewa::getId);
    public static final Comparator<Penyewa> SORT_BY_NAME = Comparator.comparing(Penyewa::getNama);
    public static final String COLUMN_ID = "id";

    @Override
    public List<Penyewa> getAll() throws SQLException {
        return jdbcTemplate.query("SELECT * FROM penyewa", (rs, rowNum) -> {
            Penyewa p = new Penyewa();
            p.setId(rs.getString(COLUMN_ID));
            p.setNama(rs.getString("nama"));
            p.setAlamat(rs.getString("alamat"));
            p.setJenisKelamin(rs.getString("jns_kelamin"));
            p.setJenisMakanan(rs.getString("jns_makanan"));
            p.setNoTelp(rs.getString("no_telp"));
            p.setMenginap(rs.getBoolean("menginap"));
            return p;
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

    @Override
    public List<Penyewa> getAllSortedBy(Comparator<Penyewa> sorter) throws SQLException {
        List<Penyewa> res = getAll();
        Collections.sort(res, sorter != null ? sorter : SORT_BY_ID);
        return res;
    }

    @Override
    public Penyewa getById(String id) throws SQLException {
        return jdbcTemplate.query("SELECT * FROM penyewa WHERE id=?", new String[]{id}, new int[]{VARCHAR}, rs -> {
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

    @Override
    public int insert(Penyewa p) throws SQLException {
        String sql = "INSERT INTO penyewa(id,nama,JNS_KELAMIN,ALAMAT,NO_TELP,JNS_MAKANAN,MENGINAP) VALUES (?,?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, new Object[]{p.getId(), p.getNama(), p.getJenisKelamin().name(), p.getAlamat(), p.getNoTelp(), p.getJenisMakanan().name(), p.isMenginap()}, new int[]{VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, BOOLEAN});
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

    @Override
    public int deleteById(String id) throws SQLException {
        final String query = "DELETE FROM penyewa WHERE id=?";
        return jdbcTemplate.update(query, new Object[]{id}, new int[]{VARCHAR});
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

    @Override
    public int update(Penyewa p) throws SQLException {
        return jdbcTemplate.update("UPDATE PENYEWA SET NAMA=?,JNS_KELAMIN=?,ALAMAT=?,NO_TELP=?,JNS_MAKANAN=?,MENGINAP=? WHERE  id=?",
                new Object[]{p.getNama(),
                        p.getJenisKelamin().name(),
                        p.getAlamat(),
                        p.getNoTelp(),
                        p.getJenisMakanan().name(),
                        p.isMenginap(),
                        p.getId()},
                new int[]{VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR});
    }
}
