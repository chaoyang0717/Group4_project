package order.category;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class MD5
{	
	public String plainText;
	public String str;

	public String changepwd(String password){
		this.plainText = password+"playcoo2002";
		try
		{	
			MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");// 進行MD5轉碼
			mdAlgorithm.update(plainText.getBytes());// 轉碼需要轉換為getBytes
			byte[] digest = mdAlgorithm.digest();
			StringBuffer hexString = new StringBuffer();// 將MD5轉換後的byte轉成字串
			for (int i = 0; i < digest.length; i++)
			{
				plainText = Integer.toHexString(0xFF & digest[i]);

				if (plainText.length() < 2)
				{
					plainText = "0" + plainText;
				}
				hexString.append(plainText);
				str = hexString.toString();
			}
			return str;

		} catch (NoSuchAlgorithmException ex)
		{
			Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
		}
		return null;
	}

}
