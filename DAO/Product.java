package order.category;

public class Product
{
	public String product_id;
	public int category_id;
	public String product_name;
	public String product_name_en;
	public int price;
	public String summary;
	public String filename_big;
	public String filename_small;
	
	public Product(String product_id, int category_id, String product_name, String product_name_en, int price,
			String summary, String filename_big, String filename_small)
	{
		this.product_id = product_id;
		this.category_id = category_id;
		this.product_name = product_name;
		this.product_name_en = product_name_en;
		this.price = price;
		this.summary = summary;
		this.filename_big = filename_big;
		this.filename_small = filename_small;
	}
	
	
	
	
}
