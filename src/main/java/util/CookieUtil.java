package util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class CookieUtil {
    private static final String USER_ID = "user_id";
    private static final String TOKEN = "token_user";
    private static final String REMEMBER_COOKIE = "remember_me";
    private static final int COOKIE_AGE = 30 * 24 * 60 * 60; // 30 ngày

    // Lưu cookie đăng nhập khi chọn "Remember Me"
    public static void saveLoginInfo(HttpServletResponse response, String id, String token, boolean remember) {
        if (remember) {
            Cookie userCookie = new Cookie(USER_ID, id);
            Cookie tokenCookie = new Cookie(TOKEN, token);
            Cookie rememberCookie = new Cookie(REMEMBER_COOKIE, "checked");

            userCookie.setMaxAge(COOKIE_AGE);
            tokenCookie.setMaxAge(COOKIE_AGE);
            rememberCookie.setMaxAge(COOKIE_AGE);

            userCookie.setPath("/");
            tokenCookie.setPath("/");
            rememberCookie.setPath("/");

            response.addCookie(userCookie);
            response.addCookie(tokenCookie);
            response.addCookie(rememberCookie);
        } else {
            clearLoginInfo(response);
        }
    }
    // Xóa cookie khi đăng xuất
    public static void clearLoginInfo(HttpServletResponse response) {
        Cookie userCookie = new Cookie(USER_ID, "");
        Cookie tokenCookie = new Cookie(TOKEN, "");
        Cookie rememberCookie = new Cookie(REMEMBER_COOKIE, "");

        userCookie.setMaxAge(0);
        tokenCookie.setMaxAge(0);
        rememberCookie.setMaxAge(0);

        userCookie.setPath("/");
        tokenCookie.setPath("/");
        rememberCookie.setPath("/");

        response.addCookie(userCookie);
        response.addCookie(tokenCookie);
        response.addCookie(rememberCookie);
    }
}