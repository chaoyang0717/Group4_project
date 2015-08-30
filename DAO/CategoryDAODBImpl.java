package order.category;

import java.sql.*;
import java.util.ArrayList;

public class CategoryDAODBImpl implements CategoryDAO
{
	final String DRIVE_NAME = "com.mysql.jdbc.Driver"; // 指定jdbc驅動
	final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" + "user=root&password=1234";// 指定SQL位置和障密

	@Override
	public void add(Category category)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement(
					"Insert into category (category_id, category_name,category_name_en) values (?,?,?)");
			pstmt.setInt(1, category.category_id);
			pstmt.setString(2, category.category_name);
			pstmt.setString(3, category.category_name_en);
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

	}

	@Override
	public void update(Category category)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement(
					"Update category Set category_name=?,category_name_en=? where category_id=?");
			
			pstmt.setString(1, category.category_name);
			pstmt.setString(2, category.category_name_en);
			pstmt.setInt(3, category.category_id);
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

	}

	@Override
	public void remove(Category category)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement(
					"Delete from category where category_id=?");

			pstmt.setInt(1, category.category_id);
			pstmt.executeUpdate();

			pstmt.close();
			conn.close();
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}


	}

	@Override
	public Category findById(int category_id)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement("Select * from category where category_id = ?");
            pstmt.setInt(1, category_id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next())
            {
            	Category c = new Category(rs.getInt(1), rs.getString(2), rs.getString(3));
                return c;
            }
            else
            {
                return null;
            }
            
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<Category> getAllCategory()
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from Category Order By category_id");

			ArrayList<Category> mylist = new ArrayList();

			while (rs.next())
			{
				mylist.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			rs.close();
			stmt.close();
			conn.close();
			return mylist;
		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}

		return null;
	}

	
	@Override
	public ArrayList<Category> getRangeCategory(int start, int size)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);
			
			Statement stmt = conn.createStatement();// 得到一個執行SQL
			ResultSet rs = stmt.executeQuery("Select * From category order by category_id limit "+(start-1)+","+size);// 執行SQL

			ArrayList<Category> mylist = new ArrayList<>();

			while (rs.next())
			{
				mylist.add(new Category(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
			;

			rs.close();
			stmt.close();
			conn.close();
			return mylist;

		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int getSize()
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);
			
			Statement stmt = conn.createStatement();// 得到一個執行SQL
			ResultSet rs = stmt.executeQuery("Select count(*) From category ");// 執行SQL

			rs.next();
			
			int size=rs.getInt(1);
			rs.close();
			stmt.close();
			conn.close();
			return size;

		} catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		} catch (SQLException e)
		{
			e.printStackTrace();
		}
		return -1;
	}

}
