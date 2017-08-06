package app.repository

import app.controller.event
import app.model.Event
import org.springframework.beans.factory.annotation.Autowire
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Bean
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.ResultSetExtractor
import org.springframework.stereotype.Repository

import java.sql.SQLException
import java.sql.Types
import java.util.Collections
import java.util.Comparator
import java.util.Date

import java.sql.Types.DATE
import java.sql.Types.VARCHAR

/**
 * Created by ric on 04/03/17.
 */
@Repository
class EventDAO @Autowired
constructor(template: JdbcTemplate) : DAO<Event>(template) {

    @Throws(SQLException::class)
    override fun getAll(): List<Event> {
        return jdbcTemplate.query("SELECT * FROM event") { rs, row ->
            event {
                id = rs.getString(COLUMN_ID)
                nama = rs.getString(COLUMN_NAMA_EVENT)
                penyelenggara = rs.getString(COLUMN_PENYELENGGARA)
                mulai = Date(rs.getDate(COLUMN_MULAI_EVENT).time)
                selesai = Date(rs.getDate(COLUMN_SELESAI_EVENT).time)
            }
        }
    }

    @Throws(SQLException::class)
    override fun getAllSortedBy(comparator: Comparator<Event>?): List<Event> {
        val res = getAll()
        return if (comparator != null) res.sortedWith(comparator) else res.sortedBy { it.id }
    }

    @Throws(SQLException::class)
    override fun getById(id: String): Event? {
        return jdbcTemplate.query<Event>("SELECT * FROM event WHERE id=?", arrayOf<Any>(id), intArrayOf(VARCHAR)) { rs ->
            if (rs.next()) {
                event {
                    this.id = rs.getString(COLUMN_ID)
                    nama = rs.getString(COLUMN_NAMA_EVENT)
                    penyelenggara = rs.getString(COLUMN_PENYELENGGARA)
                    mulai = Date(rs.getDate(COLUMN_MULAI_EVENT).time)
                    selesai = Date(rs.getDate(COLUMN_SELESAI_EVENT).time)
                }
            } else null
        }
    }

    @Throws(SQLException::class)
    override fun insert(obj: Event): Int {
        val sql = String.format("insert into event(%s,%s,%s,%s,%s) VALUES (?,?,?,?,?)",
                COLUMN_ID,
                COLUMN_NAMA_EVENT,
                COLUMN_PENYELENGGARA,
                COLUMN_MULAI_EVENT,
                COLUMN_SELESAI_EVENT)
        return jdbcTemplate.update(sql,
                arrayOf(obj.id, obj.nama, obj.penyelenggara, java.sql.Date(obj.mulai.time), java.sql.Date(obj.selesai.time)),
                intArrayOf(VARCHAR, VARCHAR, VARCHAR, DATE, DATE)
        )
    }

    @Throws(SQLException::class)
    override fun deleteById(id: String): Int {
        return jdbcTemplate.update("DELETE FROM event WHERE id=?",
                arrayOf<Any>(id), intArrayOf(VARCHAR))
    }

    @Throws(SQLException::class)
    override fun update(obj: Event): Int {
        return jdbcTemplate.update("UPDATE event SET NAMA_EVENT=?,PENYELENGGARA=?,MULAI_EVENT=?,SELESAI_EVENT=? WHERE ID=?",
                arrayOf(obj.nama, obj.penyelenggara, java.sql.Date(obj.mulai.time), java.sql.Date(obj.selesai.time), obj.id),
                intArrayOf(VARCHAR, VARCHAR, DATE, DATE, VARCHAR))
    }

    fun getJumlahPeserta(id: String): Int {
        return jdbcTemplate.query("select count(id_penyewa) from transaksi where id_event=?", arrayOf(id),
                ResultSetExtractor { rs ->
                    if (rs.next()) {
                        rs.getInt(1)
                    } else 0
                })
    }

    companion object {
        @JvmField val COLUMN_ID = "id"
        @JvmField val COLUMN_NAMA_EVENT = "nama_event"
        @JvmField val COLUMN_PENYELENGGARA = "penyelenggara"
        @JvmField val COLUMN_MULAI_EVENT = "mulai_event"
        @JvmField val COLUMN_SELESAI_EVENT = "selesai_event"
    }
}
