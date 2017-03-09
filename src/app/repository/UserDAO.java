package app.repository;

import app.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import static java.sql.Types.VARCHAR;

/**
 * Created by ric on 09/03/17.
 */
@Repository
public class UserDAO extends DAO<User> {
    @Autowired
    public UserDAO(JdbcTemplate template) {
        super(template);
    }

    @Override
    public List<User> getAll() throws SQLException {
        return jdbcTemplate.query("select * from pengguna", (rs, row) -> {
            User u = new User();
            u.setUsername(rs.getString("username"));
            u.setRole(rs.getString("role"));
            return u;
        });
    }

    @Override
    public List<User> getAllSortedBy(Comparator<User> comparator) throws SQLException {
        List<User> res = getAll();
        Collections.sort(res, comparator);
        return res;
    }


    @Override
    public User getById(String id) throws SQLException {
        return jdbcTemplate.query("select `username`,`role` from pengguna where id=?", new String[]{id}, new int[]{VARCHAR}, rs -> {
            if (rs.next()) {
                User u = new User();
                u.setUsername(rs.getString("username"));
                u.setRole("role");
                return u;
            }
            return null;
        });
    }

    @Override
    public int insert(User obj) throws SQLException {
        return jdbcTemplate.update("insert into pengguna(`username`,`password`,`role`) values(?,?,?)",
                new Object[]{obj.getUsername(), obj.getPassword(), obj.getRole()},
                new int[]{VARCHAR, VARCHAR, VARCHAR});
    }

    @Override
    public int deleteById(String id) throws SQLException {
        return jdbcTemplate.update("DELETE FROM pengguna WHERE `id`=?", id);
    }

    @Override
    public int update(User obj) throws SQLException {
        return jdbcTemplate.update("UPDATE PENGGUNA SET `PASSWORD`=?,`role`=? WHERE USERNAME=?",
                obj.getPassword(), obj.getRole(), obj.getUsername());
    }
}
