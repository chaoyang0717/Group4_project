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

import com.sun.corba.se.impl.protocol.giopmsgheaders.RequestMessage_1_2;

public class OrderDAOImpl implements OrderDAO{

    final String DRIVER_NAME = "com.mysql.jdbc.Driver";
    final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" +
                    "user=root&password=1234";
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

	@Override
	public Order findByOrderId(int order_id)
	{
		try {        
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            
            PreparedStatement pstmt = conn.prepareStatement("Select * from `order` where order_id = ?");
            pstmt.setInt(1, order_id);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            	Order o=new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            	PreparedStatement pstmt2 = conn.prepareStatement("Select * from orderlist where order_id = ?");
            	pstmt2.setInt(1, order_id);
            	ResultSet rs2 = pstmt2.executeQuery();
            	while (rs2.next()) {
            		o.Detail.add(new OrderList(rs2.getInt(1), rs2.getString(3), rs2.getString(4), rs2.getInt(5), rs2.getInt(6)));
             }
            	rs2.close();
            	pstmt2.close();
            	return o;
            } else {
                return null;
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }  
		return null;
	}

	@Override
	public ArrayList<Order> getAllOrders()
	{
		try {        
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from `Order` Order By order_id");
            
            ArrayList<Order> mylist = new ArrayList<>();
            
            while (rs.next()) {
            	Order o=new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                mylist.add(o);

                	PreparedStatement pstmt = conn.prepareStatement("Select * from orderlist where order_id = ?");
                	pstmt.setInt(1, o.order_id);
                	ResultSet rs2 = pstmt.executeQuery();
                	while (rs2.next()) {
                		o.Detail.add(new OrderList(rs2.getInt(1), rs2.getString(3), rs2.getString(4), rs2.getInt(5), rs2.getInt(6)));
                 }
                	rs2.close();
                	pstmt.close();
            }
                
 
            rs.close();
            stmt.close();
            conn.close();
            return mylist;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }  
		return null;
	}

	@Override
	public ArrayList<Order> getRangeOrders(int start, int size)
	{
		try {        
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from `Order` Order By order_id limit " + (start - 1) + "," + size);
                       
            ArrayList<Order> mylist = new ArrayList<>();
            
            while (rs.next()) {
            	Order o=new Order(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                mylist.add(o);

                	PreparedStatement pstmt = conn.prepareStatement("Select * from orderlist where order_id = ?");
                	pstmt.setInt(1, o.order_id);
                	ResultSet rs2 = pstmt.executeQuery();
                	while (rs2.next()) {
                		o.Detail.add(new OrderList(rs2.getInt(1), rs2.getString(3), rs2.getString(4), rs2.getInt(5), rs2.getInt(6)));
                 }
                	rs2.close();
                	pstmt.close();
            }
                
 
            rs.close();
            stmt.close();
            conn.close();
            return mylist;

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }  
		return null;
	}

	@Override
	public int getSize()
	{
		try {
            Class.forName(DRIVER_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            Statement stmt = conn.createStatement();// 得到一個執行SQL
            ResultSet rs = stmt.executeQuery("Select count(*) From `order` ");// 執行SQL

            rs.next();

            int size = rs.getInt(1);
            rs.close();
            stmt.close();
            conn.close();
            return size;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
	}

    @Override
    public void removeDetail(OrderList od) {
        try {        
            Class.forName(DRIVER_NAME);            
            Connection conn = DriverManager.getConnection(CONN_STRING);
            //conn.setAutoCommit(false);
            PreparedStatement pstmt = conn.prepareStatement("Delete From orderlist Where idOrderList=?" );
            pstmt.setInt(1, od.idOrderList);
            pstmt.executeUpdate(); 
            //conn.commit();
            //conn.setAutoCommit(true);
            pstmt.close();
            conn.close();

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAOImpl.class.getName()).log(Level.SEVERE, null, ex);
        }   
    }




    
}
