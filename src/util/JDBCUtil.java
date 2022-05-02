package util;

/**
 * Date: 2022/5/1
 */
import javax.swing.*;
import java.io.FileReader;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.Properties;

public class JDBCUtil {
    private static String url;
    private static String user;
    private static String password;
    private static String driver;

    static {
        //读取jdbc.properties
        Properties properties = new Properties();
        //获取src文件夹下的文件
        ClassLoader loader = JDBCUtil.class.getClassLoader();
        URL resource = loader.getResource("mysql.properties");
        String path = resource.getPath();
        System.out.println(path);
        try {
            properties.load(new FileReader(path));
            url = properties.getProperty("url");
            user = properties.getProperty("user");
            password = properties.getProperty("password");
            driver = properties.getProperty("driver");
            Class.forName(driver);
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {

        return DriverManager.getConnection(url, user, password);
    }


    //一个带参数的信息提示框，供找错使用
    public static void message(String msg) {
        int type = JOptionPane.YES_NO_OPTION;
        String title = "信息提示";
        JOptionPane.showMessageDialog(null, msg, title, type);
    }
}