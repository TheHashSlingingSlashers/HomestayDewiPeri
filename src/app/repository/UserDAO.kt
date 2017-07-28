package app.repository

import app.controller.user
import app.model.User
import org.springframework.beans.factory.annotation.Autowire
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Bean
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.stereotype.Repository

import java.sql.ResultSet
import java.sql.SQLException
import java.sql.Types
import java.util.Collections
import java.util.Comparator

import java.sql.Types.VARCHAR

/**
 * Created by ric on 09/03/17.
 */
@Repository
class UserDAO @Autowired
constructor(template: JdbcTemplate) : DAO<User>(template) {

    @Bean(value = "listPengguna", autowire = Autowire.BY_NAME)
    @Throws(SQLException::class)
    override fun getAll(): List<User> {
        return jdbcTemplate.query("select * from pengguna") { rs, row ->
            user {
                username = rs.getString("username")
                role = rs.getString("role")
            }
        }
    }

    @Throws(SQLException::class)
    override fun getAllSortedBy(comparator: Comparator<User>?): List<User> {
        val res = getAll()
        return if (comparator != null) res.sortedWith(comparator) else res.sortedBy { it.username }
    }


    @Throws(SQLException::class)
    override fun getById(id: String): User? {
        return jdbcTemplate.query<User>("select `username`,`password` from pengguna where username=?", arrayOf(id), intArrayOf(VARCHAR)) { rs ->
            if (rs.next()) user {
                username = rs.getString("username")
                password = rs.getString("password")
            }
            else null
        }
    }

    @Throws(SQLException::class)
    override fun insert(obj: User): Int {
        return jdbcTemplate.update("insert into pengguna(`username`,`password`,`role`) values(?,?,?)",
                arrayOf<Any>(obj.username, obj.password, obj.role),
                intArrayOf(VARCHAR, VARCHAR, VARCHAR))
    }

    @Throws(SQLException::class)
    override fun deleteById(id: String): Int {
        return jdbcTemplate.update("DELETE FROM pengguna WHERE `username`=?", id)
    }

    @Throws(SQLException::class)
    override fun update(obj: User): Int {
        return jdbcTemplate.update("UPDATE PENGGUNA SET `PASSWORD`=?,`role`=? WHERE `USERNAME`=?",
                obj.password, obj.role, obj.username)
    }
}
