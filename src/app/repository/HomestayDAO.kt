package app.repository

import app.controller.homestay
import app.model.Homestay

import java.sql.*
import java.util.*

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.*
import org.springframework.stereotype.Repository
import java.sql.Types.*


/**
 * Created by ric on 20/02/17.
 */
@Repository
class HomestayDAO @Autowired
constructor(jdbcTemplate: JdbcTemplate) : DAO<Homestay>(jdbcTemplate) {

    val SORT_BY_ID = Comparator<Homestay> { a, b -> a.id.compareTo(b.id) }

    @Throws(SQLException::class)
    override fun getAll(): List<Homestay> {
        return jdbcTemplate.query("SELECT * FROM homestay", null, null) { rs: ResultSet, rowNum: Int ->
            homestay {
                id = rs.getString("id")
                pemilik = rs.getString("pemilik")
                lokasi = rs.getString("lokasi")
                jumlahKamar = rs.getInt("jml_kamar")
                jumlahBed = rs.getInt("jml_bed")
                jumlahWC = rs.getInt("jml_wc")
                isAvailable = rs.getBoolean("status")
            }
        }
    }

    @Throws(SQLException::class)
    override fun getAllSortedBy(comparator: Comparator<Homestay>?): List<Homestay> {
        val res = getAll()
        Collections.sort(res, comparator ?: SORT_BY_ID)
        return res
    }

    @Throws(SQLException::class)
    override fun getById(id: String): Homestay? {
        return jdbcTemplate.query<Homestay>("SELECT * FROM HOMESTAY WHERE id_pemilik=?", arrayOf(id), intArrayOf(VARCHAR)) { rs: ResultSet ->
            if (rs.next()) homestay {
                this.id = rs.getString("id")
                pemilik = rs.getString("pemilik")
                idPemilik = rs.getString("id_pemilik")
                lokasi = rs.getString("lokasi")
                jumlahKamar = rs.getInt("jml_kamar")
                jumlahBed = rs.getInt("jml_bed")
                jumlahWC = rs.getInt("jml_wc")
                isAvailable = rs.getBoolean("status")
            }
            else null
        }
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

    @Throws(SQLException::class)
    override fun insert(h: Homestay): Int {
        val sql = "INSERT INTO HOMESTAY(id,pemilik,id_pemilik,LOKASI,JML_KAMAR,JML_BED,JML_WC) VALUES (?,?,?,?,?,?,?)"
        return jdbcTemplate.update(sql) { ps ->
            ps.setString(1, h.id)
            ps.setString(2, h.pemilik)
            ps.setString(3, h.idPemilik)
            ps.setString(4, h.lokasi)
            ps.setInt(5, h.jumlahKamar)
            ps.setInt(6, h.jumlahBed)
            ps.setInt(7, h.jumlahWC)
        }

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

    @Throws(SQLException::class)
    fun insertAll(data: List<Homestay>): Int {
        return jdbcTemplate.batchUpdate("INSERT INTO HOMESTAY(id,pemilik,LOKASI,JML_KAMAR,JML_BED,JML_WC) VALUES (?,?,?,?,?,?)", object : BatchPreparedStatementSetter {
            @Throws(SQLException::class)
            override fun setValues(ps: PreparedStatement, i: Int) {
                val h = data[i]
                ps.setString(1, h.id)
                ps.setString(2, h.pemilik)
                ps.setString(3, h.lokasi)
                ps.setInt(4, h.jumlahKamar)
                ps.setInt(5, h.jumlahBed)
                ps.setInt(6, h.jumlahWC)
            }

            override fun getBatchSize(): Int {
                return data.size
            }
        }).sum()
        //        int r = 0;
        //        for (Homestay h : data) {
        //            r += insert(h);
        //        }
        //        return r;
    }

    @Throws(SQLException::class)
    override fun deleteById(id: String): Int {
        val sql = "DELETE FROM HOMESTAY WHERE id=?"
        return jdbcTemplate.update(sql, arrayOf(id), intArrayOf(VARCHAR))
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

    @Throws(SQLException::class)
    override fun update(h: Homestay): Int {
        return jdbcTemplate.update("UPDATE HOMESTAY SET PEMILIK=?,LOKASI=?,JML_KAMAR=?,JML_BED=?,JML_WC=?,STATUS=? WHERE ID=?",
                arrayOf(h.pemilik, h.lokasi, h.jumlahKamar, h.jumlahBed, h.jumlahWC, h.isAvailable, h.id),
                intArrayOf(VARCHAR, VARCHAR, INTEGER, INTEGER, INTEGER, BOOLEAN, VARCHAR))
    }

//    @Throws(SQLException::class)
//    fun latestUsed(loc: String): List<Homestay> {
//        return jdbcTemplate.query<Homestay>("SELECT h.id, h.pemilik, e.selesai_event FROM t.TRANSAKSI JOIN h.HOMESTAY ON h.id = t.id_hs JOIN e.EVENT ON e.id = t.id_event WHERE h.lokasi=?",
//                arrayOf(loc), intArrayOf(VARCHAR)) { rs: ResultSet, rowNum: Int ->
//           homestay {
//                this.id = rs.getString("id")
//                pemilik = rs.getString("pemilik")
//                idPemilik = rs.getString("id_pemilik")
//                lokasi = rs.getString("lokasi")
//                jumlahKamar = rs.getInt("jml_kamar")
//                jumlahBed = rs.getInt("jml_bed")
//                jumlahWC = rs.getInt("jml_wc")
//            }
//        }
//    }
}
