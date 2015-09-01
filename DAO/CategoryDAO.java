package order.category;

import java.util.ArrayList;

public interface CategoryDAO
{
	public void add(Category category);
	public void update(Category category);
	public void remove(Category category);
	public Category findById(int category_id);
	public ArrayList<Category> getAllCategory();
	public ArrayList<Category> getRangeCategory(int start,int size);
	public int getSize();
	
	public Category findByName(String category_name);
	
	
}
