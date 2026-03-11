package dao;

import util.JDBCUtil;

import java.sql.Connection;

public class BaseDao {
    protected Connection getConnection() throws Exception {
        return JDBCUtil.getConnection();
    }
}
