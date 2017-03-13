package app.repository;

import app.model.Event;
import org.springframework.beans.factory.annotation.Autowire;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.sql.Types;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import static java.sql.Types.DATE;
import static java.sql.Types.VARCHAR;

/**
 * Created by ric on 04/03/17.
 */
@Repository
public class EventDAO extends DAO<Event> {

    public static final String COLUMN_ID = "id";
    public static final String COLUMN_NAMA_EVENT = "nama_event";
    public static final String COLUMN_PENYELENGGARA = "penyelenggara";
    public static final String COLUMN_MULAI_EVENT = "mulai_event";
    public static final String COLUMN_SELESAI_EVENT = "selesai_event";

    @Autowired
    public EventDAO(JdbcTemplate template) {
        super(template);
    }

    @Override
    public List<Event> getAll() throws SQLException {
        return jdbcTemplate.query("SELECT * FROM event", (rs, row) -> {
            Event e = new Event();
            e.setId(rs.getString(COLUMN_ID));
            e.setNama(rs.getString(COLUMN_NAMA_EVENT));
            e.setPenyelenggara(rs.getString(COLUMN_PENYELENGGARA));
            e.setMulai(new Date(rs.getDate(COLUMN_MULAI_EVENT).getTime()));
            e.setSelesai(new Date(rs.getDate(COLUMN_SELESAI_EVENT).getTime()));
            return e;
        });
    }

    @Override
    public List<Event> getAllSortedBy(Comparator<Event> comparator) throws SQLException {
        List<Event> res = getAll();
        Collections.sort(res, comparator);
        return res;
    }

    @Override
    public Event getById(String id) throws SQLException {
        return jdbcTemplate.query("SELECT * FROM event WHERE id=?", new Object[]{id}, new int[]{VARCHAR}, rs -> {
            if (rs.next()) {
                Event e = new Event();
                e.setId(rs.getString(COLUMN_ID));
                e.setNama(rs.getString(COLUMN_NAMA_EVENT));
                e.setPenyelenggara(rs.getString(COLUMN_PENYELENGGARA));
                e.setMulai(new Date(rs.getDate(COLUMN_MULAI_EVENT).getTime()));
                e.setSelesai(new Date(rs.getDate(COLUMN_SELESAI_EVENT).getTime()));
                return e;
            }
            return null;
        });
    }

    @Override
    public int insert(Event obj) throws SQLException {
        String sql = String.format("insert into event(%s,%s,%s,%s,%s) VALUES (?,?,?,?,?)",
                COLUMN_ID,
                COLUMN_NAMA_EVENT,
                COLUMN_PENYELENGGARA,
                COLUMN_MULAI_EVENT,
                COLUMN_SELESAI_EVENT);
        return jdbcTemplate.update(sql,
                new Object[]{obj.getId(),
                        obj.getNama(),
                        obj.getPenyelenggara(),
                        new java.sql.Date(obj.getMulai().getTime()),
                        new java.sql.Date(obj.getSelesai().getTime())},
                new int[]{VARCHAR, VARCHAR, VARCHAR, DATE, DATE}
        );
    }

    @Override
    public int deleteById(String id) throws SQLException {
        return jdbcTemplate.update("DELETE FROM event WHERE id=?",
                new Object[]{id}, new int[]{VARCHAR});
    }

    @Override
    public int update(Event obj) throws SQLException {
        return jdbcTemplate.update("UPDATE event SET NAMA_EVENT=?,PENYELENGGARA=?,MULAI_EVENT=?,SELESAI_EVENT=? WHERE ID=?",
                new Object[]{obj.getNama(),
                        obj.getPenyelenggara(),
                        new java.sql.Date(obj.getMulai().getTime()),
                        new java.sql.Date(obj.getMulai().getTime()), obj.getId()},
                new int[]{VARCHAR, VARCHAR, DATE, DATE, VARCHAR});
    }
}
