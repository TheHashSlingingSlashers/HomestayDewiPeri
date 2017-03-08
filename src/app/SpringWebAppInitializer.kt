package app

import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.ComponentScan
import org.springframework.context.annotation.ComponentScan.Filter
import org.springframework.context.annotation.Configuration
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext
import org.springframework.web.servlet.ViewResolver
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer
import org.springframework.web.servlet.config.annotation.EnableWebMvc
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer
import org.springframework.web.servlet.view.InternalResourceViewResolver
import org.springframework.context.annotation.FilterType
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.datasource.DriverManagerDataSource
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
    @Bean open fun viewResolver(): ViewResolver = InternalResourceViewResolver().apply {
        setPrefix("/WEB-INF/pages/")
        setSuffix(".jsp")
        setExposeContextBeansAsAttributes(true)
    }


    @Bean
    open fun jdbcTemplate(ds: DataSource) = JdbcTemplate(ds)

    @Bean
    open fun dataSource(): DataSource
            = DriverManagerDataSource("jdbc:h2:file:~/pentingsari_db", "root", "root").apply { setDriverClassName("org.h2.Driver") }


    override fun configureDefaultServletHandling(configurer: DefaultServletHandlerConfigurer) {
        configurer.enable()
    }
}

@Configuration
@ComponentScan(basePackages = arrayOf("app"), excludeFilters = arrayOf(Filter(type = FilterType.ANNOTATION, value = EnableWebMvc::class)))
open class RootConfig