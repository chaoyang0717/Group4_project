package order.category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ProductDAODBImpl implements ProductDAO {

    final String DRIVE_NAME = "com.mysql.jdbc.Driver"; // 指定jdbc驅動
    final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" + "user=root&password=1234";// 指定SQL位置和障密

    @Override
    public void add(Product product) {
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement(
                    "Insert into product (product_id,category_id, product_name,product_name_en,price,summary,filename_big,filename_small) values (?,?,?,?,?,?,?,?)");
            pstmt.setString(1, product.product_id);
            pstmt.setInt(2, product.category_id);
            pstmt.setString(3, product.product_name);
            pstmt.setString(4, product.product_name_en);
            pstmt.setInt(5, product.price);
            pstmt.setString(6, product.summary);
            pstmt.setString(7, product.filename_big);
            pstmt.setString(8, product.filename_small);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public void upDate(Product product) { //只更新資料，不更新檔案
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement(
                    "Update product Set category_id=?, product_name=?,product_name_en=?,price=?,summary=? where product_id=?");

            pstmt.setInt(1, product.category_id);
            pstmt.setString(2, product.product_name);
            pstmt.setString(3, product.product_name_en);
            pstmt.setInt(4, product.price);
            pstmt.setString(5, product.summary);
            pstmt.setString(6, product.product_id);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
    
    @Override
	public void upDateFile(Product product)
	{
		try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement(
                    "Update product Set filename_big=?, filename_small=? where product_id=?");

            pstmt.setString(1, product.filename_big);
            pstmt.setString(2, product.filename_small);
            pstmt.setString(3, product.product_id);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		
	}

    @Override
    public void remove(Product product) {
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement(
                    "Delete from product where product_id=?");

            pstmt.setString(1, product.product_id);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public Product findById(String product_id) {
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement("Select * from product where product_id = ?");
            pstmt.setString(1, product_id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));
                return p;
            } else {
                return null;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public ArrayList<Product> getAllProduct() {
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("Select * from product Order By product_id");

            ArrayList<Product> mylist = new ArrayList();

            while (rs.next()) {
                mylist.add(new Product(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
            rs.close();
            stmt.close();
            conn.close();
            return mylist;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public ArrayList<Product> getRangeProduct(int start, int size) {
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            Statement stmt = conn.createStatement();// 得到一個執行SQL
            ResultSet rs = stmt.executeQuery("Select * From product order by product_id limit " + (start - 1) + "," + size);// 執行SQL

            ArrayList<Product> mylist = new ArrayList<>();

            while (rs.next()) {
                mylist.add(new Product(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
            ;

            rs.close();
            stmt.close();
            conn.close();
            return mylist;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int getSize() {
        try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            Statement stmt = conn.createStatement();// 得到一個執行SQL
            ResultSet rs = stmt.executeQuery("Select count(*) From product ");// 執行SQL

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
	public int findByCategoryid(int category_id)
	{
		try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement("Select count(*) From product where category_id = ?");
            pstmt.setInt(1, category_id);
            ResultSet rs = pstmt.executeQuery();
            
            rs.next();
            
            int count = rs.getInt(1);
            rs.close();
            conn.close();
            return count;

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return -1;
	}

	@Override
	public Product findByName(String product_name)
	{
		try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);

            PreparedStatement pstmt = conn.prepareStatement("Select * from product where product_name = ?");
            pstmt.setString(1, product_name);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8));
                return p;
            } else {
                return null;
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
	}

	public ArrayList<Product> getByCategoryId(int category_id)
	{
		try {
            Class.forName(DRIVE_NAME);
            Connection conn = DriverManager.getConnection(CONN_STRING);
            
            PreparedStatement pstmt = conn.prepareStatement("Select * from product where category_id=?");
            pstmt.setInt(1, category_id);
            ResultSet rs = pstmt.executeQuery();
            
            ArrayList<Product> mylist = new ArrayList();
            
           
            while (rs.next()) {
                mylist.add(new Product(rs.getString(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8)));
            }
            rs.close();
            pstmt.close();
            conn.close();
            return mylist;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return null;
	}

	


}
