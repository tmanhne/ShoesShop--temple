/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import Entity.Admin;
import Entity.Bill;
import Entity.BillDetail;
import Entity.Category;
import Entity.Customer;
import Entity.Product;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DELL
 */
public class Dao {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    DBConnection dbcom;
    Connection cnn;
    PreparedStatement stm;

    /**
     *
     * @return
     */
    public Dao(DBConnection dbcom) {
        this.dbcom = dbcom;
        this.conn = dbcom.getConn();
        this.cnn = dbcom.getConn();
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "select * from category";
        try {
            //mo ket noi voi sql server
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getString(1),
                        rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int insertBill(String dateCreate, double total, String recName, String recAddress, String recPhone, int status, int cid) {
        String query = "insert into Bill(dateCreate,total,recName,recAddress,recPhone,status,cid) values(?,?,?,?,?,?,?)";
        int n = 0;
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, dateCreate);
            ps.setDouble(2, total);
            ps.setString(3, recName);
            ps.setString(4, recAddress);
            ps.setString(5, recPhone);
            ps.setInt(6, status);
            ps.setInt(7, cid);
            n = ps.executeUpdate();
            //rs=stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;
    }

    public int getBid() {
        String sql = "select top (1) bid from Bill order by bid DESC";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
        }
        return 0;
    }

    public int insertBillDetails(int bid, String pid, int quantity, double price) {
        String query = "insert into BillDetail(bid,pid,quantity,price) values(?,?,?,?)";
        int n = 0;
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, bid);
            ps.setString(2, pid);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            n = ps.executeUpdate();
            //rs=stm.executeQuery();
        } catch (Exception ex) {
        }
        return n;

    }

    public Customer selectCustomer(String n) {

        String query = "select * from Customer where username=?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, n);
            rs = ps.executeQuery();
            while (rs.next()) {
                Customer c = new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7));
                return c;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int checkId(String id, List<Product> list) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getPid().equals(id)) {
                return i;
            }
        }

        return -1;
    }

    public Product add(String id) {
        String sql = "select * from Product where pid=?";
        try {
            stm = cnn.prepareStatement(sql);
            stm.setString(1, id);
            rs = stm.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1), rs.getString(2), 1, rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }

        } catch (Exception e) {
        }
        return null;
    }

    /**
     *
     * @return
     */
    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product order by price";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    /**
     *
     * @param user
     * @param pass
     * @return
     */
//    public Customer checkLoginC(String user, String pass) {
//        String query = "select username,password from Customer WHERE username =? AND password =?";
//        try {
//            conn = new context.DBContext().getConnection();
//            ps = conn.prepareStatement(query);
//            ps.setString(1, user);
//            ps.setString(2, pass);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new Customer(user, pass);
//            }
//        } catch (Exception e) {
//        }
//        return null;
//    }
    public Admin checkLogin(String user, String pass) {
        String query = "select * from Admin WHERE username =? AND password =?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(user, pass);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Customer checkcus(String user, String pass) {
        String query = "select username,password from Customer WHERE username =? AND password =?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(user, pass);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Admin checkAccEx(String user) {
        String query = "select * from Admin WHERE username =?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(rs.getString(1), rs.getString(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void Signup(String user, String pass) {
        String sql = "insert into admin values(?,?)";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeQuery();
        } catch (Exception e) {

        }
    }

    public int addBill(Bill bill) {
        int n = 0;
        String sql = "insert into Bill(dateCreate,total,recName,recAddress,recPhone,cid) values(?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, bill.getDateCreate());
            pre.setDouble(2, bill.getTotal());
            pre.setString(3, bill.getRecName());
            pre.setString(4, bill.getAddress());
            pre.setString(5, bill.getRecPhone());
            pre.setInt(6, bill.getCid());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    /**
     *
     * @param cid
     * @return
     */
    public List<Product> getProductByCate(String cid) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product where cateid=?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProduct(String txt) {
        String query = "select * from Product where pid = ?";
        List<Product> list = new ArrayList<>();
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, txt);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void deleteP(String pid) {
        String query = "delete from Product where pid=?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertPro(String id, String name, String quantity, String price, String image, String des, int cateid) {
        String sql = "insert into Product(pid,pname,quantity,price,image,description,cateID) values(?,?,?,?,?,?,?)";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, quantity);
            ps.setString(4, price);
            ps.setString(5, image);
            ps.setString(6, des);
            ps.setInt(7, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void editProduct(String pid, String name, String quantity, String price, String image, String des, int cateid) {
        String sql = "update product set pname = ?, quantity = ?, price = ?, image = ?, description= ?, cateId = ? where pId = ? ";

        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, quantity);
            ps.setString(3, price);
            ps.setString(4, image);
            ps.setString(5, des);
            ps.setString(7, pid);
            ps.setInt(6, cateid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Product getProductByID(String id) {
        String query = "select * from Product\n"
                + "where pid = ?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Customer> getAllCus() {
        List<Customer> list = new ArrayList<>();
        String query = "select * from Customer order by cid";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertBill(String dateCreate, double total, String recName, String address, String recPhone, int cid) {
        String query = "insert into Bill(dateCreate,total,recName,recAddress,recPhone,cid) values(?,?,?,?,?,?)";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, dateCreate);
            ps.setDouble(2, total);
            ps.setString(3, recName);
            ps.setString(4, address);
            ps.setString(5, recPhone);
            ps.setInt(6, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCus(String name, String address, String phone, String username, String pass) {
        String sql = "insert into Customer(fullname,address,phone,username,password) values(?,?,?,?,?)";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }

    }

    public void deleteC(int cid) {
        String query = "delete from Customer where cid=?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Customer getCusbyId(int cid) {
        String query = "select * from Customer\n"
                + "where cid = ?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cid);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Customer(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editCus(String name, String address, String phone, String username, String pass, String cid) {
        String sql = "update Customer set fullname = ?, address = ?, phone = ?, username = ?, password = ? where cid = ?";

        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, pass);
            ps.setString(6, cid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Bill> getAllBill() {
        List<Bill> list = new ArrayList<>();
        String query = "select * from Bill order by total";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Bill getNewBill() {
        String query = "select * from Bill where bid  = (select MAX(bid) from Bill)";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Bill(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), 0, rs.getInt(8));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String query = "select * from Product\n"
                + "where pname like ?";
        try {
            conn = new context.DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txtSearch + "%");// % hai bên là chứa '%oc cho %'
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6), rs.getString(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<BillDetail> getBillDetailById(String bid) {
        List<BillDetail> list = new ArrayList<>();
        String query = "select a.bid,b.pname,c.recName,a.quantity,a.price from BillDetail a join Product b on a.pid = b.pid join bill c on a.bid = c.bid where a.bid='"+bid+"'";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BillDetail(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getDouble(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    public List<BillDetail> getBillNameById(String bid) {
        List<BillDetail> list = new ArrayList<>();
        String query = "select c.recName from BillDetail a join Product b on a.pid = b.pid join bill c on a.bid = c.bid where a.bid='"+bid+"'";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new BillDetail(rs.getInt(1), rs.getString(2),rs.getString(3), rs.getInt(4), rs.getDouble(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
     public void update(int bid) {
        String sql = "update Bill set status ='1' where bid = ?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
     public List<Bill> getAllBillbyStatus(int status) {
        List<Bill> list = new ArrayList<>();
        String query = "select * from Bill a join Customer b on a.cid = b.cid where a.status='"+status+"'";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Bill(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getInt(7), rs.getInt(8)));
            }
        } catch (Exception e) {
        }
        return list;
    }
     public void deleteBD(int bid) {
        String sql = "delete  from BillDetail where bid=?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
     public void deleteB(int bid) {
        String sql = "delete  from Bill where bid=?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
     public void changebackStatus(int bid) {
        String sql = "update Bill set status ='0' where bid = ?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, bid);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
     public void updateProcess(String status,int bid) {
        String sql = "update Bill set status = ? where bid = ?";
        try {
            conn = new context.DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(2, bid);
            ps.setString(1, status);
            ps.executeUpdate();
        } catch (Exception e) {
            
        }
    }
     public void register(String fullname,String address,String phone,String username,String password) {
        String sql = "insert into Customer(fullname,address,phone,username,password) values(?,?,?,?,?)";
        try {
            conn = new DBConnection().getConn();
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, address);
            ps.setString(3, phone);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.executeUpdate();
        } catch (SQLException ex) {

        }
    }
     

    /**
     *
     * @param args
     */
    public static void main(String[] args) {

    }
}
