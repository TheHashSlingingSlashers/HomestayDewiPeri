package app.controller

import app.model.Homestay
import app.model.Penyewa
import app.repository.HomestayDAO
import app.repository.PenyewaDAO
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod.GET
import org.springframework.web.bind.annotation.RequestMethod.POST

/**
 * Created by ric on 28/02/17.
 */


@Controller
@RequestMapping("/")
class HomeController {
    @RequestMapping(method = arrayOf(GET))
    fun home() = "index"
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
    fun lihat() = "lihat-penyewa"

    @RequestMapping("/new", method = arrayOf(GET))
    fun tambah() = "tambah-penyewa"

    @RequestMapping("/new", method = arrayOf(POST))
    fun tambahSubmit(@ModelAttribute p: Penyewa): String {
        dao.insert(p)
        return "redirect:/penyewa"
    }
}