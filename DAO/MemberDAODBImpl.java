package order.category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MemberDAODBImpl implements MemberDAO{
    
    final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" +
                    "user=root&password=123456";

    @Override
    public void add(Member member) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Insert into member (member_account,member_password,member_tel,member_email) values (?,?,?,?)");
            pstmt.setString(1, member.member_account);//account=email
            pstmt.setString(2, member.member_password);
            pstmt.setString(3, member.member_tel);
            pstmt.setString(4, member.member_email);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void update(Member member) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Update member Set member_account=?, member_password=?, member_tel=?, member_email=?  Where member_id=?");            
            pstmt.setString(1, member.member_account);
            pstmt.setString(2, member.member_password);
            pstmt.setString(3, member.member_tel);
            pstmt.setString(4, member.member_email);
            pstmt.setInt(5, member.member_id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void remove(Member member) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Delete From member Where member_id=?");
            pstmt.setInt(1, member.member_id);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public Member findById(String member_id) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Select * from member where member_id = ?");
            pstmt.setString(1, member_id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next())
            {
                Member s = new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return s;
            }
            else
            {
                return null;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Member> getAllMembers() {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);    
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from member Order By member_id");
            
            ArrayList<Member> mylist = new ArrayList();
            
            while(rs.next())
            {
                mylist.add(new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));                
            }
            rs.close();
            stmt.close();
            conn.close();
            return mylist;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Member> getRangeMembers(int start, int size) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);    
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from Member Order By member_id " +  
                    "Limit " + (start-1) + "," + size);
            
            ArrayList<Member> mylist = new ArrayList();
            
            while(rs.next())
            {
                mylist.add(new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));                
            }
            rs.close();
            stmt.close();
            conn.close();
            return mylist;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public Member findByAccount(String member_account) {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            PreparedStatement pstmt = conn.prepareStatement("Select * from member where member_account = ?");
            pstmt.setString(1, member_account);            
            ResultSet rs = pstmt.executeQuery();
            if (rs.next())
            {
                Member s = new Member(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                return s;
            }
            else
            {
                return null;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }        

    @Override
    public int getSize() {
        try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);    
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select count(*) from member");
            
            
            ArrayList<Member> mylist = new ArrayList();
            rs.next(); 
            int size = rs.getInt(1); 
            return size;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MemberDAODBImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
}
