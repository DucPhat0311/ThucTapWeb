package util;


import java.util.UUID;

import org.mindrot.jbcrypt.BCrypt;

public class Encode {

//Tạo salt, mỗi salt khác nhau cho user

    public static String hash(String plainPassword) {
        return BCrypt.hashpw(plainPassword, BCrypt.gensalt(10));
    }

    public static boolean verify(String plainPassword, String hashedPassword) {
        return BCrypt.checkpw(plainPassword, hashedPassword);
    }

    public static String createTokens() {
        return UUID.randomUUID().toString();
    }
}
