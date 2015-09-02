package order.category;

import java.util.ArrayList;

public interface BackAccountDAO
{
	public void add(BackAccount backAccount);
	public void updata(BackAccount backAccount);
	public void remove(BackAccount backAccount);
	public BackAccount findByAccount(String account);
	public ArrayList<BackAccount> getAllBackAccount();
	public ArrayList<BackAccount> getRangeBackAccount(int start,int size);
	public int getSize();

}
