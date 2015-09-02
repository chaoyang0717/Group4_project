//package edu.pccu.student;
package order.category;

import java.util.ArrayList;

public class Order {
    public int order_id;  //order_id改為int
    public String member_id;
    public String customer_name;
    public String customer_tel;
    //public String order_date; //DB欄位待删
    public String take;//取貨方式
    public String address;
    public ArrayList<OrderList> Detail;

    public Order(int order_id, String member_id, String customer_name, String customer_tel,/* String order_date,*/ String take, String address) {
        this.order_id = order_id;
        this.member_id = member_id;
        this.customer_name = customer_name;
        this.customer_tel = customer_tel;
        //this.order_date = order_date;
        this.take = take;
        this.address = address;
        Detail=new ArrayList<OrderList>();
    }
    
    
}
