//package edu.pccu.student;
package order.category;

import java.util.ArrayList;

public class OrderList {
    public int idOrderList;
    public int order_id;   //order_id改為int,此欄位在OrderList表單
    //public String member_id;  //講師說此欄位要拿掉
    public String product_id;
    public String product_name_ch;
    public int price;
    public int quantity;

    public OrderList(int idOrderList, /*int order_id, String member_id,*/ String product_id, String product_name_ch, int price, int quantity) {
        this.idOrderList = idOrderList;
        this.order_id = order_id;
        //this.member_id = member_id;
        this.product_id = product_id;
        this.product_name_ch = product_name_ch;
        this.price = price;
        this.quantity = quantity;
    }
    
    
}
