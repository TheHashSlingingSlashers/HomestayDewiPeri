package app.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.sql.SQLException;
import java.util.Comparator;
import java.util.List;

/**
 * Created by ric on 04/03/17.
 */
public abstract class DAO<T> {
    protected JdbcTemplate jdbcTemplate;

    @Autowired
    public DAO(JdbcTemplate template) {
        jdbcTemplate = template;
    }

    public abstract List<T> getAll() throws SQLException;

    public abstract List<T> getAllSortedBy(Comparator<T> comparator) throws SQLException;

    public abstract T getById(String id) throws SQLException;

    public abstract int insert(T obj) throws SQLException;

    public abstract int deleteById(String id) throws SQLException;

    public abstract int update(T obj) throws SQLException;
}
