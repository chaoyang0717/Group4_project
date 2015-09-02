//package edu.pccu.student;
package order.category;

import java.util.ArrayList;

public interface OrderDAO {
    public void add(Order o);
    public void update(Order o);
    public void remove(Order o);
    /*public Order findById(String order_id);
    public ArrayList<Order> getAllOrders();        
    public ArrayList<Order> getRangeOrders(int start, int size);*/
}
