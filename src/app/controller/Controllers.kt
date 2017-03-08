package app.controller

import app.model.Event
import app.model.Homestay
import app.model.Penyewa
import app.repository.EventDAO
import app.repository.HomestayDAO
import app.repository.PenyewaDAO
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.ResultSetExtractor
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod.GET
import org.springframework.web.bind.annotation.RequestMethod.POST
import org.springframework.web.bind.annotation.RequestParam
import java.sql.ResultSet
import java.sql.Types.VARCHAR
import java.util.*
import javax.servlet.http.HttpServletRequest

/**
 * Created by ric on 28/02/17.
 */

private operator fun <E> Enumeration<E>.contains(e: E?): Boolean {
    if (e == null) return false
    while (hasMoreElements()) {
        val d = nextElement()
        if (d == e) return true
    }
    return false
}


@Controller
@RequestMapping("/")
class HomeController {
    @Autowired
    private lateinit var jdbcTemplate: JdbcTemplate

    @RequestMapping(method = arrayOf(GET))
    fun home(req: HttpServletRequest): String {
        val session = req.session
        return if ("user" !in session.attributeNames) "redirect:/login"
        else "index"
    }

    @RequestMapping("/login", method = arrayOf(GET))
    fun login(req: HttpServletRequest): String {
        return if ("user" in req.session.attributeNames) "redirect:/"
        else "login"
    }

    @RequestMapping("/login", method = arrayOf(POST))
    fun loginSubmit(req: HttpServletRequest, @RequestParam("username") user: String?, @RequestParam("password") pass: String?): String {
        if (validateLogin(jdbcTemplate, user, pass)) {
            req.session.setAttribute("user", user)
            return "redirect:/"
        } else return "/login"
    }

    private fun validateLogin(template: JdbcTemplate, username: String?, password: String?): Boolean {
        if (username == null || password == null) return false
        val sql = "SELECT * FROM pengguna WHERE `username`=? AND `password`=?"
        return template.query(sql, arrayOf(username, password), intArrayOf(VARCHAR, VARCHAR), ResultSetExtractor(ResultSet::next))
    }

}


@Controller
@RequestMapping("/homestay")
class HomestayController {
    @Autowired
    private lateinit var homestayDAO: HomestayDAO

    @RequestMapping(method = arrayOf(GET))
    fun lihat() = "lihat-homestay"

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "tambah-homestay"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(@ModelAttribute homestay: Homestay): String {
        homestayDAO.insert(homestay)
        return "redirect:/homestay"
    }
}

@Controller @RequestMapping("/penyewa")
class PenyewaController {
    @Autowired private lateinit var dao: PenyewaDAO

    @RequestMapping(method = arrayOf(GET))
    fun lihat(): String = "lihat-penyewa"

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "tambah-penyewa"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(@ModelAttribute p: Penyewa): String {
        dao.insert(p)
        return "redirect:/penyewa"
    }
}


@Controller @RequestMapping("/event")
class EventController {
    @Autowired private lateinit var dao: EventDAO

    @RequestMapping(method = arrayOf(GET))
    fun lihat() = "lihat-event"

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "event-baru"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(@ModelAttribute event: Event): String {
        dao.insert(event)
        return "redirect:/event"
    }
}

