package app.repository

import app.controller.penyewa
import app.model.Penyewa
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository

import java.sql.*
import java.util.*

import java.sql.Types.BOOLEAN
import java.sql.Types.VARCHAR

/**
 * Created by ric on 20/02/17.
 */
@Repository
class PenyewaDAO @Autowired
constructor(jdbcTemplate: JdbcTemplate) : DAO<Penyewa>(jdbcTemplate) {

    @Throws(SQLException::class)
    override fun getAll(): List<Penyewa> {
        return jdbcTemplate.query("SELECT * FROM penyewa") { rs, rowNum ->
            penyewa {
                id = rs.getString(COLUMN_ID)
                nama = rs.getString("nama")
                alamat = rs.getString("alamat")
                setJenisKelamin(rs.getString("jns_kelamin"))
                setJenisMakanan(rs.getString("jns_makanan"))
                noTelp = rs.getString("no_telp")
                isMenginap = rs.getBoolean("menginap")
            }
        }
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

    @Throws(SQLException::class)
    override fun getAllSortedBy(comparator: Comparator<Penyewa>?): List<Penyewa> {
        val res = getAll()
        Collections.sort(res, comparator ?: SORT_BY_ID)
        return res
    }

    @Throws(SQLException::class)
    override fun getById(id: String): Penyewa? {
        return jdbcTemplate.query<Penyewa>("SELECT * FROM penyewa WHERE id=?", arrayOf(id), intArrayOf(VARCHAR)) { rs ->
            if (rs.next())
                penyewa {
                    this.id = rs.getString(COLUMN_ID)
                    nama = rs.getString("nama")
                    alamat = rs.getString("alamat")
                    setJenisKelamin(rs.getString("jns_kelamin"))
                    setJenisMakanan(rs.getString("jns_makanan"))
                    noTelp = rs.getString("no_telp")
                    isMenginap = rs.getBoolean("menginap")
                }
            else null
        }
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

    @Throws(SQLException::class)
    override fun insert(p: Penyewa): Int {
        val sql = "INSERT INTO penyewa(id,nama,JNS_KELAMIN,ALAMAT,NO_TELP,JNS_MAKANAN,MENGINAP) VALUES (?,?,?,?,?,?,?)"
        return jdbcTemplate.update(sql, arrayOf(p.id, p.nama, p.jenisKelamin.name, p.alamat, p.noTelp, p.jenisMakanan.name, p.isMenginap), intArrayOf(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, BOOLEAN))
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

    @Throws(SQLException::class)
    fun insertAll(data: Collection<Penyewa>): Int {
        var r = 0
        for (p in data) {
            r += insert(p)
        }
        return r
    }

    @Throws(SQLException::class)
    override fun deleteById(id: String): Int {
        val query = "DELETE FROM penyewa WHERE id=?"
        return jdbcTemplate.update(query, arrayOf<Any>(id), intArrayOf(VARCHAR))
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

    @Throws(SQLException::class)
    override fun update(p: Penyewa): Int {
        return jdbcTemplate.update("UPDATE PENYEWA SET NAMA=?,JNS_KELAMIN=?,ALAMAT=?,NO_TELP=?,JNS_MAKANAN=?,MENGINAP=? WHERE  id=?",
                arrayOf(p.nama, p.jenisKelamin.name, p.alamat, p.noTelp, p.jenisMakanan.name, p.isMenginap, p.id),
                intArrayOf(VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR, VARCHAR))
    }

    companion object {

        val SORT_BY_ID = Comparator<Penyewa> { a, b -> a.id.compareTo(b.id) }
        val SORT_BY_NAME = Comparator<Penyewa> { a, b -> a.nama.compareTo(b.nama) }
        val COLUMN_ID = "id"
    }
}
