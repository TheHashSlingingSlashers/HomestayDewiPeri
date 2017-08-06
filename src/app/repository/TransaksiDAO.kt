package app.repository

import app.model.Transaksi
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.PreparedStatementCreator
import org.springframework.jdbc.core.PreparedStatementSetter
import org.springframework.jdbc.core.ResultSetExtractor
import org.springframework.stereotype.Repository
import java.sql.ResultSet
import java.sql.Types
import java.util.Comparator

@Repository
class TransaksiDAO
@Autowired constructor(jdbc: JdbcTemplate) : DAO<Transaksi>(jdbc) {
    override fun getAll(): List<Transaksi> {
        return jdbcTemplate.query("SELECT * FROM transaksi") { rs, i ->
            Transaksi().apply {
                idEvent = rs.getString("id_event")
                idPenyewa = rs.getString("id_penyewa")
                idHomestay = rs.getString("id_hs")
            }
        }
    }

    override fun getAllSortedBy(comparator: Comparator<Transaksi>?): List<Transaksi> {
        return comparator?.let {
            getAll().sortedWith(it)
        } ?: getAll().sortedBy { it.idEvent }
    }

    override fun getById(id: String): Transaksi? {
        return jdbcTemplate.query<Transaksi>("SELECT * FROM transaksi WHERE id_event=?", arrayOf(id), { rs: ResultSet ->
            if (rs.next()) {
                Transaksi().apply {
                    idEvent = rs.getString("id_event")
                    idPenyewa = rs.getString("id_penyewa")
                    idHomestay = rs.getString("id_homestay")
                }
            } else null
        })
    }

    override fun insert(obj: Transaksi): Int {
        return jdbcTemplate.update("INSERT INTO transaksi VALUES (?,?,?)") {
            it.apply {
                setString(1, obj.idPenyewa)
                setString(2, obj.idHomestay)
                setString(3, obj.idEvent)
            }
        }
    }

    override fun deleteById(id: String): Int {
TODO()
    }

    override fun update(obj: Transaksi): Int {
        return jdbcTemplate.update("update transaksi set id_hs=? where id_event=? and id_penyewa=?"){
            it.apply{
                setString(1,obj.idHomestay)
                setString(2, obj.idEvent)
                setString(3,obj.idPenyewa)
            }
        }
    }

}