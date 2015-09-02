//package edu.pccu.student;
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

public class OrderDAOImpl implements OrderDAO{

    final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" +
                    "user=root&password=123456";
    @Override
    public void add(Order o) {
        try {        
            Class.forName(DRIVER_NAME);
            
            Connection conn = DriverManager.getConnection(CONN_STRING);
            conn.setAutoCommit(false);
            
            PreparedStatement pstmt = conn.prepareStatement("Insert into `Order` ( member_id, customer_name, customer_tel, take, address) values (?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, o.member_id);
            pstmt.setString(2, o.customer_name);
            pstmt.setString(3, o.customer_tel);
            pstmt.setString(4, o.take);
            pstmt.setString(5, o.address);
            pstmt.executeUpdate();                        
            ResultSet rs = pstmt.getGeneratedKeys();
            rs.next();
            int auto_id = rs.getInt(1);
            rs.close();
            for (OrderList od : o.Detail)
            {
                PreparedStatement pstmt2 = conn.prepareStatement("Insert into orderlist (order_id, product_id, product_name_ch, price, quantity) values (?,?,?,?,?)");
                pstmt2.setInt(1, auto_id);
                pstmt2.setString(2, od.product_id);
                pstmt2.setString(3, od.product_name_ch);
                pstmt2.setInt(4, od.price);
                pstmt2.setInt(5, od.quantity);
                
                pstmt2.executeUpdate();
             }
            
            conn.commit();
            conn.setAutoCommit(true);
            conn.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }

    @Override
    public void update(Order o) {
        try {        
            Class.forName(DRIVER_NAME);
            
            Connection conn = DriverManager.getConnection(CONN_STRING);
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement("Update `Order` Set member_id=?, customer_name=?, customer_tel=?, take=?, address=? Where order_id=?"/*, Statement.RETURN_GENERATED_KEYS*/);
            pstmt.setString(1, o.member_id);
            pstmt.setString(2, o.customer_name);
            pstmt.setString(3, o.customer_tel);
            pstmt.setString(4, o.take);
            pstmt.setString(5, o.address);
            pstmt.setInt(6, o.order_id);
            pstmt.executeUpdate();                        
           /* ResultSet rs = pstmt.getGeneratedKeys();
            rs.next();
            int auto_id = rs.getInt(1);
            rs.close();*/  //以上4行是為了取得自動產生id
            for (OrderList od : o.Detail)
            {
                PreparedStatement pstmt2 = conn.prepareStatement("Update orderlist (product_id=?, product_name_ch=?, price=?, quantity=? Where idOrderList=?");
                //pstmt2.setInt(1, auto_id);
                pstmt2.setString(2, od.product_id);
                pstmt2.setString(3, od.product_name_ch);
                pstmt2.setInt(4, od.price);
                pstmt2.setInt(5, od.quantity);
                pstmt2.setInt(6, od.idOrderList);
                
                pstmt2.executeUpdate();
             }
            
            conn.commit();
            conn.setAutoCommit(true);
            conn.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }

    @Override
    public void remove(Order o) {
         try {        
            Class.forName(DRIVER_NAME);
            
            Connection conn = DriverManager.getConnection(CONN_STRING);
            conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement("Delete From `Order` Where order_id=?" /*, Statement.RETURN_GENERATED_KEYS*/);
            pstmt.setInt(1, o.order_id);
            pstmt.executeUpdate();  
            
            PreparedStatement pstmt1 = conn.prepareStatement("Delete From orderlist Where order_id=?" /*, Statement.RETURN_GENERATED_KEYS*/);
            pstmt1.setInt(1, o.order_id);
            pstmt1.executeUpdate();  
            /*ResultSet rs = pstmt.getGeneratedKeys();
            rs.next();
            int auto_id = rs.getInt(1);
            rs.close();*/  //以上4行是為了取得自動產生id
            
            
            /*for (OrderList od : o.Detail)    //删除不跑for迴圈,直接删orderlist的order_id,注意不是idOrderList
            {
                PreparedStatement pstmt2 = conn.prepareStatement("Delete From orderlist  Where idOrderList=?");
                //pstmt2.setInt(1, auto_id);                
                pstmt2.setInt(1, od.idOrderList);
                
                pstmt2.executeUpdate();
             }*/
            
            conn.commit();
            conn.setAutoCommit(true);
            conn.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }
    
}
