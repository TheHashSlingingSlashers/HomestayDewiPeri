package app

import app.repository.EventDAO
import app.repository.HomestayDAO
import app.repository.PenyewaDAO
import app.repository.UserDAO
import org.h2.tools.RunScript
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.ComponentScan.Filter
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.FilterType
import org.springframework.context.event.ContextStartedEvent
import org.springframework.context.event.EventListener
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.ResultSetExtractor
import org.springframework.jdbc.datasource.DriverManagerDataSource
import org.springframework.web.servlet.ViewResolver
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer
import org.springframework.web.servlet.view.InternalResourceViewResolver
import java.sql.ResultSet
import javax.servlet.ServletContextEvent
import javax.servlet.ServletContextListener
import javax.servlet.annotation.WebListener
import javax.sql.DataSource


/**
 * Created by ric on 28/02/17.
 */
class SpringWebAppInitializer : AbstractAnnotationConfigDispatcherServletInitializer() {

    override fun getRootConfigClasses()
            = arrayOf<Class<*>>()

    override fun getServletMappings()
            = arrayOf("/")

    override fun getServletConfigClasses()
            = arrayOf(WebConfig::class.java)

}


@Configuration
@EnableWebMvc
@WebListener
@ComponentScan("app")
open class WebConfig : WebMvcConfigurerAdapter(), ServletContextListener {
    override fun contextInitialized(sce: ServletContextEvent?) {
        jdbcTemplate(dataSource()).query("SHOW TABLES", ResultSetExtractor {
            if (!it.next()) {
                val `is` = javaClass.classLoader.getResourceAsStream("backup.sql")
                assert(`is` != null)
                RunScript.execute(dataSource().connection, `is`!!.reader())
            }
        })
    }

    override fun contextDestroyed(sce: ServletContextEvent?) {
    }

    @EventListener
    fun onStartup(e: ContextStartedEvent) {
        jdbcTemplate(dataSource()).query("show tables", {
            if (!it.next()) {
                val `is` = ClassLoader.getSystemClassLoader().getResourceAsStream("backup.sql")
                assert(`is` != null)
                RunScript.execute(dataSource().connection, `is`.reader())
            }
        })
    }

    @Bean open fun viewResolver(): ViewResolver = InternalResourceViewResolver().apply {
        setPrefix("/WEB-INF/pages/")
        setSuffix(".jsp")
        setExposeContextBeansAsAttributes(true)
    }


    @Bean
    open fun jdbcTemplate(ds: DataSource) = JdbcTemplate(ds)

    @Bean
    open fun dataSource(): DataSource
            = DriverManagerDataSource("jdbc:h2:file:~/pentingsari_db", "root", "root")
            .apply { setDriverClassName("org.h2.Driver") }


    override fun configureDefaultServletHandling(configurer: DefaultServletHandlerConfigurer) {
        configurer.enable()
    }

//    @Bean open fun eventDAO(): EventDAO = EventDAO(jdbcTemplate(dataSource()))
//    @Bean open fun penyewaDAO() = PenyewaDAO(jdbcTemplate(dataSource()))
//    @Bean open fun homestayDAO() = HomestayDAO(jdbcTemplate(dataSource()))
//    @Bean open fun userDAO() = UserDAO(jdbcTemplate(dataSource()))
}

@Configuration
@ComponentScan(basePackages = arrayOf("app"), excludeFilters = arrayOf(Filter(type = FilterType.ANNOTATION, value = EnableWebMvc::class)))
open class RootConfig

