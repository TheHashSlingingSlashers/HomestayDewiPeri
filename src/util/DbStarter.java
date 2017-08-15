package util;

import org.h2.tools.RunScript;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * Created by ric on 21/02/17.
 */
public class DbStarter implements ServletContextListener {

    public static Connection getConnection() {
        if (conn != null) return conn;
        throw new IllegalStateException("not initialized");
    }

    private static Connection conn;

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        try {
            org.h2.Driver.load();

            // This will get the setting from a context-param in web.xml if
            // defined:
            ServletContext servletContext = servletContextEvent.getServletContext();
            //TODO: ganti url db di production code
            String url = "jdbc:h2:file:~/pentingsari_db";
            String user = "root";
            String password = "root";
            //String url = "jdbc:oracle:thin:@172.23.9.185:1521:orcl";
            //String user = "eduardus";
            //String password = "eduardus01";
            conn = DriverManager.getConnection(url, user, password);
            servletContext.setAttribute("connection", conn);
            try (Statement s = conn.createStatement();
                 ResultSet rs = s.executeQuery("show tables");) {
                if (!rs.next()) {
                    RunScript.execute(conn, new InputStreamReader(getClass().getResourceAsStream("backup.sql")));
                }
            }

        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        try {
            Statement stat = conn.createStatement();
            stat.execute("SHUTDOWN");
            stat.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        conn = null;
    }
}
