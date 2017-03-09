package app.repository;

import app.model.Homestay;
import java.sql.*;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.*;
import org.springframework.stereotype.Repository;
import util.DbStarter;

import static java.sql.Types.INTEGER;
import static java.sql.Types.VARCHAR;


/**
 * Created by ric on 20/02/17.
 */
@Repository
public class HomestayDAO extends DAO<Homestay> {

    @Autowired
    public HomestayDAO(JdbcTemplate jdbcTemplate) {
        super(jdbcTemplate);
    }

    public final Comparator<Homestay> SORT_BY_ID = Comparator.comparing(Homestay::getId);

    @Override
    public List<Homestay> getAll() throws SQLException {
        return jdbcTemplate.query("SELECT * FROM homestay", null, null, (ResultSet rs, int rowNum) -> {
            Homestay h = new Homestay();
            h.setId(rs.getString("id"));
            h.setPemilik(rs.getString("pemilik"));
            h.setLokasi(rs.getString("lokasi"));
            h.setJumlahKamar(rs.getInt("jml_kamar"));
            h.setJumlahBed(rs.getInt("jml_bed"));
            h.setJumlahWC(rs.getInt("jml_wc"));
            return h;
        });
    }

    @Override
    public List<Homestay> getAllSortedBy(Comparator<Homestay> sorter) throws SQLException {
        List<Homestay> res = getAll();
        Collections.sort(res, sorter != null ? sorter : SORT_BY_ID);
        return res;
    }

    @Override
    public Homestay getById(String id) throws SQLException {
        return jdbcTemplate.query("SELECT * FROM HOMESTAY WHERE id=?", new String[]{id}, new int[]{VARCHAR}, (ResultSet rs) -> {
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
            return null;
        });
//        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement("SELECT * FROM HOMESTAY WHERE id=?");) {
//            ps.setString(1, id);
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//                Homestay h = new Homestay();
//                h.setId(rs.getString("id"));
//                h.setPemilik(rs.getString("pemilik"));
//                h.setLokasi(rs.getString("lokasi"));
//                h.setJumlahKamar(rs.getInt("jml_kamar"));
//                h.setJumlahBed(rs.getInt("jml_bed"));
//                h.setJumlahWC(rs.getInt("jml_wc"));
//                return h;
//            }
//        }
//        return null;
    }

    @Override
    public int insert(Homestay h) throws SQLException {
        String sql = "INSERT INTO HOMESTAY(id,pemilik,LOKASI,JML_KAMAR,JML_BED,JML_WC) VALUES (?,?,?,?,?,?)";
        return jdbcTemplate.update(sql, ps -> {
            ps.setString(1, h.getId());
            ps.setString(2, h.getPemilik());
            ps.setString(3, h.getLokasi());
            ps.setInt(4, h.getJumlahKamar());
            ps.setInt(5, h.getJumlahBed());
            ps.setInt(6, h.getJumlahWC());
        });

//        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(sql)) {
//            ps.setString(1, h.getId());
//            ps.setString(2, h.getPemilik());
//            ps.setString(3, h.getLokasi());
//            ps.setInt(4, h.getJumlahKamar());
//            ps.setInt(5, h.getJumlahBed());
//            ps.setInt(6, h.getJumlahWC());
//            return ps.executeUpdate();
//        } catch (SQLException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return 0;
//        }
    }

    public final int insertAll(List<Homestay> data) throws SQLException {
        return Arrays.stream(jdbcTemplate.batchUpdate("INSERT INTO HOMESTAY(id,pemilik,LOKASI,JML_KAMAR,JML_BED,JML_WC) VALUES (?,?,?,?,?,?)", new BatchPreparedStatementSetter() {
            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {
                Homestay h = data.get(i);
                ps.setString(1, h.getId());
                ps.setString(2, h.getPemilik());
                ps.setString(3, h.getLokasi());
                ps.setInt(4, h.getJumlahKamar());
                ps.setInt(5, h.getJumlahBed());
                ps.setInt(6, h.getJumlahWC());
            }

            @Override
            public int getBatchSize() {
                return data.size();
            }
        })).sum();
//        int r = 0;
//        for (Homestay h : data) {
//            r += insert(h);
//        }
//        return r;
    }

    @Override
    public final int deleteById(String id) throws SQLException {
        String sql = "DELETE FROM HOMESTAY WHERE id=?";
        return jdbcTemplate.update(sql, new String[]{id}, new int[]{VARCHAR});
//        try (PreparedStatement ps = DbStarter.getConnection().prepareStatement(sql)) {
//            ps.setString(1, id);
//            return ps.executeUpdate();
//        } catch (SQLException e) {
//            throw e;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return 0;
//        }
    }

    @Override
    public int update(Homestay h) throws SQLException {
        return jdbcTemplate.update("UPDATE HOMESTAY SET PEMILIK=?,LOKASI=?,JML_KAMAR=?,JML_BED=?,JML_WC=? WHERE ID=?",
                new Object[]{h.getPemilik(),
                        h.getLokasi(),
                        h.getJumlahKamar(),
                        h.getJumlahBed(),
                        h.getJumlahWC(),
                        h.getId()},
                new int[]{VARCHAR, VARCHAR, INTEGER, INTEGER, INTEGER, VARCHAR});
    }
}
