package app.controller

import app.model.User
import app.repository.EventDAO
import app.repository.HomestayDAO
import app.repository.PenyewaDAO
import app.repository.UserDAO
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.jdbc.core.JdbcTemplate
import org.springframework.jdbc.core.ResultSetExtractor
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod.GET
import org.springframework.web.bind.annotation.RequestMethod.POST
import org.springframework.web.bind.annotation.RequestParam
import java.sql.ResultSet
import java.text.SimpleDateFormat
import java.util.*
import javax.servlet.http.HttpServletRequest


@Controller
@RequestMapping("/")
class HomeController {
    @Autowired
    private lateinit var jdbcTemplate: JdbcTemplate
    @Autowired private lateinit var dao: HomestayDAO

    @RequestMapping(method = arrayOf(GET))
    fun home(model:Model, req: HttpServletRequest): String {
        val session = req.session
        if ("user" !in session.attributeNames) return "redirect:/login"
        else {
            val user = req.session.getAttribute("user")
            if (user != null && (user as User).role == "S")
                return "index"
            else {
                val id = req["username"]

                return "pemilik-hs"
            }
        }
    }

    @RequestMapping("/login", method = arrayOf(GET))
    fun login(req: HttpServletRequest): String {
        return if ("user" in req.session.attributeNames) "redirect:/"
        else "login"
    }

    @RequestMapping("/login", method = arrayOf(POST))
    fun loginSubmit(req: HttpServletRequest, @RequestParam("username") user: String?, @RequestParam("password") pass: String?): String {
        val u = validateLogin(user, pass)
        req.session.setAttribute("user", u)
        return if (u != null) "redirect:/" else "redirect:/login"
    }

    @RequestMapping("/logout", method = arrayOf(GET))
    fun logout(req: HttpServletRequest): String {
        req.session.clearAttributes()
        return "redirect:/login"
    }

//    @RequestMapping("/pemilik-hs", method = arrayOf(GET))
//    fun viewHs(@RequestParam("username") user: String, model: Model): String {
//        val h = dao.getById(user)
//        model.addAttribute("homestay", h)
//        return "pemilik-hs"
//    }

    private fun validateLogin(username: String?, password: String?): User? {
        if (username == null || password == null) return null
        val sql = "SELECT * FROM pengguna WHERE `USERNAME`=? AND `PASSWORD`=?"
        return jdbcTemplate.query(sql, arrayOf(username, password), ResultSetExtractor {
            if (it.next()) {
                user {
                    this.username = it.getString("username")
                    role = it.getString("role")
                }
            } else null
        })
    }
}


@Controller
@RequestMapping("/homestay")
class HomestayController {
    @Autowired
    private lateinit var homestayDAO: HomestayDAO

    @RequestMapping(method = arrayOf(GET))
    fun lihat(model: Model): String {
        val listHomestay = homestayDAO.getAll()
        model.addAttribute("listHomestay", listHomestay)
        return "lihat-homestay"
    }

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "tambah-homestay"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(req: HttpServletRequest): String {
        val homestay = homestay {
            id = req["id"]
            pemilik = req["pemilik"]
            idPemilik = req["idPemilik"]
            lokasi = req["lokasi"]
            jumlahKamar = req["jumlahKamar"]?.toInt() ?: 0
            jumlahBed = req["jumlahBed"]?.toInt() ?: 0
            jumlahWC = req["jumlahWC"]?.toInt() ?: 0
        }
        homestayDAO.insert(homestay)
        return "redirect:/homestay"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(GET))
    fun edit(@PathVariable("id") id: String, model: Model): String {
        val h = homestayDAO.getById(id)
        model.addAttribute("homestay", h)
        return "edit-homestay"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(POST))
    fun editSubmit(@PathVariable id: String, req: HttpServletRequest): String {
        val h = homestay {
            this.id = id
            pemilik = req["pemilik"]
            lokasi = req["lokasi"]
            jumlahKamar = req["jumlahKamar"]?.toInt() ?: 0
            jumlahBed = req["jumlahBed"]?.toInt() ?: 0
            jumlahWC = req["jumlahWC"]?.toInt() ?: 0
        }
        homestayDAO.update(h)
        return "redirect:/homestay"
    }

    @RequestMapping("/delete/{id}", method = arrayOf(GET))
    fun delete(@PathVariable("id") id: String): String {
        homestayDAO.deleteById(id)
        return "redirect:/homestay"
    }
}

@Controller @RequestMapping("/penyewa")
class PenyewaController {
    @Autowired private lateinit var dao: PenyewaDAO
    //    @Autowired private lateinit var eventDAO: EventDAO
    @RequestMapping(method = arrayOf(GET))
    fun lihat(model: Model): String {
        val listPenyewa = dao.getAll()
        model.addAttribute("listPenyewa", listPenyewa)
        return "lihat-penyewa"
    }

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah(model: Model): String {
        val listEvent = dao.getAll()
        model.addAttribute("listEvent", listEvent)
        return "tambah-penyewa"
    }

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(req: HttpServletRequest): String {
        val p = penyewa {
            id = req["id"]
            nama = req["nama"]
            alamat = req["alamat"]
            noTelp = req["noTelp"]
            setJenisKelamin(req["jenisKelamin"])
            setJenisMakanan(req["jenisMakanan"])
            isMenginap = req["menginap"]?.toBoolean() ?: false
        }
        dao.insert(p)
        return "redirect:/penyewa"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(GET))
    fun edit(@PathVariable("id") id: String, model: Model): String {
        val p = dao.getById(id)
        model.addAttribute("penyewa", p)
        return "edit-penyewa"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(POST))
    fun editSubmit(@PathVariable("id") id: String, req: HttpServletRequest): String {
        val p = penyewa {
            this.id = id
            nama = req["nama"]
            alamat = req["alamat"]
            noTelp = req["noTelp"]
            setJenisKelamin(req["jenisKelamin"])
            setJenisMakanan(req["jenisMakanan"])
            isMenginap = req["menginap"]?.toBoolean() ?: false
        }
        dao.update(p)
        return "redirect:/penyewa"
    }

    @RequestMapping("/delete/{id}", method = arrayOf(GET))
    fun delete(@PathVariable("id") id: String): String {
        dao.deleteById(id)
        return "redirect:/penyewa"
    }
}


@Controller @RequestMapping("/event")
class EventController {
    @Autowired private lateinit var dao: EventDAO

    @RequestMapping(method = arrayOf(GET))
    fun lihat(model: Model): String {
        model.addAttribute("listEvent", dao.getAll())
        model.addAttribute("formatter", SimpleDateFormat("dd-MM-Y"))
        return "lihat-event"
    }

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "tambah-event"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(req: HttpServletRequest): String {
        val event = event {
            id = req["id"] ?: ""
            nama = req.getParameter("nama") ?: ""
            penyelenggara = req.getParameter("penyelenggara") ?: ""
            if (req.getParameter("mulai") != null) {
                setMulai(req.getParameter("mulai"))
            } else {
                mulai = Date()
            }
            if (req.getParameter("selesai") != null) {
                setSelesai(req.getParameter("selesai"))
            } else {
                selesai = Date()
            }
        }
        dao.insert(event)
        return "redirect:/event"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(GET))
    fun edit(@PathVariable("id") id: String, model: Model): String {
        val event = dao.getById(id)
        model.addAttribute("event", event)
        return "edit-event"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(POST))
    fun editSubmit(@PathVariable("id") id: String, req: HttpServletRequest): String {
        val event = event {
            this.id = id
            nama = req.getParameter("nama") ?: ""
            penyelenggara = req.getParameter("penyelenggara") ?: ""
            if (req.getParameter("mulai") != null) {
                setMulai(req.getParameter("mulai"))
            } else {
                mulai = Date()
            }
            if (req.getParameter("selesai") != null) {
                setSelesai(req.getParameter("selesai"))
            } else {
                selesai = Date()
            }
        }
        dao.update(event)
        return "redirect:/event"
    }
}

@Controller @RequestMapping("/pengguna")
class UserController {
    @Autowired private lateinit var dao: UserDAO

    @RequestMapping(method = arrayOf(GET))
    fun lihat(model: Model): String {
        val users = dao.getAll()
        model.addAttribute("listPengguna", users)
        return "lihat-pengguna"
    }

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "tambah-pengguna"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(req: HttpServletRequest): String {
        val user = user {
            username = req["username"]
            password = req["password"]
            role = req["role"]
        }
        dao.insert(user)
        return "redirect:/pengguna"
    }

    @RequestMapping("/edit/{id}", method = arrayOf(GET))
    fun edit(@PathVariable("id") id: String, model: Model): String {
        val p = dao.getById(id)
        model.addAttribute("pengguna", p)
        return "edit-password"
    }

    @RequestMapping("/edit", method = arrayOf(POST))
    fun editSubmit(@RequestParam("username") user: String?, @RequestParam("password") password: String?): String {
        val u = user { username = user;this.password = password }
        dao.update(u)
        return "redirect:/pengguna"
    }

    @RequestMapping("/delete/{id}", method = arrayOf(GET))
    fun delete(@PathVariable("id") id: String): String {
        dao.deleteById(id)
        return "redirect:/pengguna"
    }
}

@Controller @RequestMapping("/manajemen")
class ManagementHS {
    @RequestMapping(method = arrayOf(GET))
    fun asd() = "manajemen-hs"
}

@Controller @RequestMapping("/pemilik-hs")
class PemilikHomestay {
    @Autowired private lateinit var dao: HomestayDAO

    @RequestMapping(method = arrayOf(GET))
    fun asd(req: HttpServletRequest, model:Model): String{
        val h = dao.getById("P4ij0")
        model.addAttribute("homestay", h)
        return "pemilik-hs"
    }
}

