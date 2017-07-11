package app.repository

import app.model.Penyewa
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate

import java.sql.SQLException
import java.util.Comparator

/**
 * Created by ric on 04/03/17.
 */
abstract class DAO<T> @Autowired
constructor(@Autowired
            protected var jdbcTemplate: JdbcTemplate) {

    @Throws(SQLException::class)
    abstract fun getAll(): List<T>

    @Throws(SQLException::class)
    abstract fun getAllSortedBy(comparator: Comparator<T>?): List<T>

    @Throws(SQLException::class)
    abstract fun getById(id: String): T?

    @Throws(SQLException::class)
    abstract fun insert(obj: T): Int

    @Throws(SQLException::class)
    abstract fun deleteById(id: String): Int

    @Throws(SQLException::class)
    abstract fun update(obj: T): Int

}
