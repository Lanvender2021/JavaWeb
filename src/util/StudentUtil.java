package util;

import entity.Student;

import java.sql.*;
import java.util.ArrayList;

/**
 * Date: 2022/5/1
 */
public class StudentUtil {
    /**
     * @return ResultSet
     */
    public static ArrayList<Student> queryStudents() {
        String sql = "select sid,sname,ssex,sage,sweight from stuinfo";
        ArrayList<Student> students = new ArrayList<>();
        try (Connection con = JDBCUtil.getConnection();
             PreparedStatement st = con.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setSsex(rs.getString("ssex"));
                s.setSage(rs.getInt("sage"));
                s.setSweight(rs.getInt("sweight"));
                students.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("无法查询学生， 错误信息：" + e.getMessage());
        }
        return students;
    }

    public static Student queryStudent(int sid) {
        String sql = "select sid,sname,ssex,sage,sweight from stuinfo where sid =" + sid;

        Student s = new Student();
        try (Connection con = JDBCUtil.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)
        ) {
            while (rs.next()) {
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setSsex(rs.getString("ssex"));
                s.setSage(rs.getInt("sage"));
                s.setSweight(rs.getInt("sweight"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("无法查询学生， 错误信息：" + e.getMessage());
        }
        return s;
    }

    /**
     * 添加数据
     *
     * @param s
     * @return
     */
    public static int addStudent(Student s) {

        String sql = "insert into stuinfo(SID,SName,SSex,SAge,SWeight) values(?,?,?,?,?)";
        try (Connection con = JDBCUtil.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, s.getSid());
            st.setString(2, s.getSname());
            st.setString(3, s.getSsex());
            st.setInt(4, s.getSage());
            st.setInt(5, s.getSweight());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("操作失败，错误信息：" + e.getMessage());
        }
        return 0;
    }

    public static int updateStudent(Student s) {
        String sql = "update  stuinfo set sname = ?,ssex = ?,  sage= ?,sweight = ? where sid = ?;";
        try (Connection con = JDBCUtil.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(5, s.getSid());
            st.setString(1, s.getSname());
            st.setString(2, s.getSsex());
            st.setInt(3, s.getSage());
            st.setInt(4, s.getSweight());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("操作失败，错误信息：" + e.getMessage());
        }
        return 0;
    }

    public static int deleteStudent(int sid) {
        String sql = "delete from stuinfo where sid= ?;";
        try (Connection con = JDBCUtil.getConnection();
             PreparedStatement st = con.prepareStatement(sql)) {
            st.setInt(1, sid);
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("操作失败，错误信息：" + e.getMessage());
        }
        return 0;
    }

}
