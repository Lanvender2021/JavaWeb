package util;

import entity.Student;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Date: 2022/5/1
 */
public class StudentUtil {
    /**
     * @return ResultSet
     */
    public static ArrayList<Student> queryStudents() {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "select sid,sname,ssex,sage,sweight from stuinfo";
        ArrayList<Student> students = new ArrayList<>();
        try {
            con = JDBCUtil.getConnection();
            st = con.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                s.setSsex(rs.getString("ssex"));
                ;
                s.setSage(rs.getInt("sage"));
                s.setSweight(rs.getInt("sweight"));
                students.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("无法查询学生， 错误信息：" + e.getMessage());
        } finally {
            JDBCUtil.close(st, con, rs);
        }
        return students;
    }

    public static Student queryStudent(int sid) {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String sql = "select sid,sname,ssex,sage,sweight from stuinfo where sid = ?";
        Student s = new Student();
        try {
            con = JDBCUtil.getConnection();
            st = con.prepareStatement(sql);
            st.setInt(1,sid);
            rs = st.executeQuery();
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
        } finally {
            JDBCUtil.close(st, con, rs);
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
        Connection con = null;
        PreparedStatement st = null;
        String sql = "insert into stuinfo(SID,SName,SSex,SAge,SWeight) values(?,?,?,?,?)";
        try {
            con = JDBCUtil.getConnection();
            st = con.prepareStatement(sql);

            st.setInt(1, s.getSid());
            st.setString(2, s.getSname());
            st.setString(3, s.getSsex());
            st.setInt(4, s.getSage());
            st.setInt(5, s.getSweight());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("操作失败，错误信息：" + e.getMessage());
        } finally {
            JDBCUtil.close(st, con);
        }
        return 0;
    }

    public static int updateStudent(Student s) {
        Connection con = null;
        PreparedStatement st = null;
        String sql = "update  stuinfo set sname = ?,ssex = ?,  sage= ?,sweight = ? where sid = ?;";
        try {
            con = JDBCUtil.getConnection();
            st = con.prepareStatement(sql);
            st.setInt(5, s.getSid());
            st.setString(1, s.getSname());
            st.setString(2, s.getSsex());
            st.setInt(3, s.getSage());
            st.setInt(4, s.getSweight());
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("操作失败，错误信息：" + e.getMessage());
        } finally {
            JDBCUtil.close(st, con);
        }
        return 0;
    }

    public static int deleteStudent(int sid) {
        Connection con = null;
        PreparedStatement st = null;
        String sql = "delete from stuinfo where sid= ?;";
        try {
            con = JDBCUtil.getConnection();
            st = con.prepareStatement(sql);
            st.setInt(1,sid);
            return st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            JDBCUtil.message("操作失败，错误信息：" + e.getMessage());
        } finally {
            JDBCUtil.close(st, con);
        }
        return 0;
    }

}
