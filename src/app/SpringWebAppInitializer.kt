package app

import app.repository.EventDAO
import org.h2.tools.RunScript
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.ComponentScan.Filter
import org.springframework.context.annotation.Configuration
import org.springframework.context.annotation.FilterType
import org.springframework.context.event.ContextRefreshedEvent
import org.springframework.context.event.ContextStartedEvent
import org.springframework.context.event.EventListener
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.datasource.DriverManagerDataSource
import org.springframework.web.servlet.ViewResolver
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer
import org.springframework.web.servlet.view.InternalResourceViewResolver
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
@ComponentScan("app")
open class WebConfig : WebMvcConfigurerAdapter() {
    @EventListener(ContextRefreshedEvent::class,ContextStartedEvent::class)
    fun onStartup() {
        jdbcTemplate(dataSource()).query("show tables", {
            if (!it.next()) {
                RunScript.execute(dataSource().connection, javaClass.getResourceAsStream("backup.sql").reader())
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

    @Bean open fun eventDAO(): EventDAO = EventDAO(jdbcTemplate(dataSource()))
}

@Configuration
@ComponentScan(basePackages = arrayOf("app"), excludeFilters = arrayOf(Filter(type = FilterType.ANNOTATION, value = EnableWebMvc::class)))
open class RootConfig