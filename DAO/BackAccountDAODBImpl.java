package order.category;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class BackAccountDAODBImpl implements BackAccountDAO
{
	final String DRIVE_NAME = "com.mysql.jdbc.Driver"; // 指定jdbc驅動
	final String CONN_STRING = "jdbc:mysql://localhost:3306/mydb?" + "user=root&password=1234";// 指定SQL位置和障密


	@Override
	public void add(BackAccount backAccount)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement(
					"Insert into cms_account (account, password,emp_id,per_id) values (?,?,?,?)");
			pstmt.setString(1, backAccount.account);
			pstmt.setString(2, backAccount.password);
			pstmt.setInt(3, backAccount.emp_id);
			pstmt.setInt(4, backAccount.per_id);
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
	public void updeat(BackAccount backAccount)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement(
					"Update cms_account Set password=?,emp_id=?,per_id=? where account=?");
			
			pstmt.setString(1, backAccount.password);
			pstmt.setInt(2, backAccount.emp_id);
			pstmt.setInt(3, backAccount.per_id);
			pstmt.setString(4, backAccount.account);
			
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
	public void remove(BackAccount backAccount)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement(
					"Delete from cms_account where account=?");

			pstmt.setString(1, backAccount.account);
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
	public BackAccount findByAccount(String account)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			PreparedStatement pstmt = conn.prepareStatement("Select * from cms_account where account = ?");
			pstmt.setString(1, account);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next())
            {
            	BackAccount acc = new BackAccount(rs.getString(1), rs.getString(2),rs.getInt(3), rs.getInt(4));
                return acc;
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
	public ArrayList<BackAccount> getAllBackAccount()
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);

			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("Select * from cms_account Order By account");

			ArrayList<BackAccount> mylist = new ArrayList();

			while (rs.next())
			{
				mylist.add(new BackAccount(rs.getString(1), rs.getString(2),rs.getInt(3), rs.getInt(4)));
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
	public ArrayList<BackAccount> getRangeBackAccount(int start, int size)
	{
		try
		{
			Class.forName(DRIVE_NAME);
			Connection conn = DriverManager.getConnection(CONN_STRING);
			
			Statement stmt = conn.createStatement();// 得到一個執行SQL
			ResultSet rs = stmt.executeQuery("Select * From cms_account order by account limit "+(start-1)+","+size);// 執行SQL

			ArrayList<BackAccount> mylist = new ArrayList<>();

			while (rs.next())
			{
				mylist.add(new BackAccount(rs.getString(1), rs.getString(2),rs.getInt(3), rs.getInt(4)));
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
			ResultSet rs = stmt.executeQuery("Select count(*) From cms_account ");// 執行SQL

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
