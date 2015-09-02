package order.category;

import java.util.ArrayList;

public interface ProductDAO
{
	public void add(Product product);
	public void upDate(Product product);
	public void upDateFile(Product product);
	public void remove(Product product);
	public Product findById(String product_id);
	public ArrayList<Product> getAllProduct();
    public ArrayList<Product> getRangeProduct(int start,int size);
	public int getSize();
	
	//刪除種類要確認是否有被product使用
	public int findByCategoryid(int category_id);
	public Product findByName(String product_name);
	public ArrayList<Product> getByCategoryId(int category_id);
	
}
