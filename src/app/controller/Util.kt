package app.controller

import app.model.Event
import app.model.Homestay
import app.model.Penyewa
import app.model.User
import java.util.*
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpSession

/**
 * Created by ric on 15/03/17.
 */
/**
 * Created by ric on 28/02/17.
 */
inline fun event(init: Event.() -> Unit) = Event().apply { init() }

inline fun user(init: User.() -> Unit) = User().apply { init() }
inline fun penyewa(init: Penyewa.() -> Unit) = Penyewa().apply { init() }
inline fun homestay(init: Homestay.() -> Unit) = Homestay().apply { init() }
operator fun HttpServletRequest.get(name: String): String? = getParameter(name)
internal operator fun <E> Enumeration<E>.contains(e: E?): Boolean {
    if (e == null) return false
    while (hasMoreElements()) {
        val d = nextElement()
        if (d == e) return true
    }
    return false
}

fun HttpSession.clearAttributes() {
    for (attr in attributeNames.iterator()) {
        removeAttribute(attr)
    }
}