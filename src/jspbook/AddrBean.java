package jspbook;

import java.util.*;
import java.sql.*;

public class AddrBean {

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://localhost:3306/jspdb";

    //database 연결을 위한 메서드 선언

    void connect(){
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url,"root","rootpass");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    //database 연결 해제를 위한 메서드
    void disconnect(){
        if(rs!=null){
            try {
                rs.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }

        if (pstmt !=null){
            try {
                pstmt.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        if (conn !=null){
            try {
                conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
    //신규 주소록 메세지추가 메서드
    public boolean insertDB(AddrBook addrbook){

        connect();

        String sql = "insert into addrbook (name,email,tel,company) values(?,?,?,?)";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,addrbook.getName());
            pstmt.setString(2,addrbook.getEmail());
            pstmt.setString(3,addrbook.getTel());
            pstmt.setString(4,addrbook.getCompany());
            pstmt.executeUpdate();

        }catch (SQLException e){

            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
        return true;
    }

    //database 로부터 모든 레코드를 추출하는 메서드

    public ArrayList<AddrBook> getDBList(){
        connect();


        ArrayList<AddrBook> datas = new ArrayList<AddrBook>();

        String sql = "select * from addrbook order by id desc";

        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()){
                AddrBook addrBook = new AddrBook();
                addrBook.setId(rs.getInt("id"));
                addrBook.setName(rs.getString("name"));
                addrBook.setEmail(rs.getString("email"));
                addrBook.setCompany(rs.getString("company"));
                addrBook.setTel(rs.getString("tel"));

                datas.add(addrBook);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return datas;
    }

    //특정 주소록 게시글 가져오는 메서드
    public AddrBook getDB(int id){
        connect();

        String sql = "select * from addrbook where id=?";
        AddrBook addrbook = new AddrBook();

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            ResultSet rs = pstmt.executeQuery();

            rs.next();

            addrbook.setId(rs.getInt("id"));
            addrbook.setName(rs.getString("name"));
            addrbook.setEmail(rs.getString("email"));
            addrbook.setTel(rs.getString("tel"));
            addrbook.setCompany(rs.getString("company"));
        } catch (SQLException e){
            e.printStackTrace();
        }
        finally {
            disconnect();
        }
        return addrbook;
    }

    //특정 주소록 게시글 삭제 메서드
    public boolean deleteDB(int id){
        connect();

        String sql = "delete from addrbook where id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }

        finally {
            disconnect();
        }
        return true;
    }

    public boolean updateDB (AddrBook addrBook){
        connect();

        String sql = "update addrbook set name=?, email=?, tel=? , company=? where id=?";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,addrBook.getName());
            pstmt.setString(2,addrBook.getEmail());
            pstmt.setString(3,addrBook.getTel());
            pstmt.setString(4,addrBook.getCompany());
            pstmt.setInt(5,addrBook.getId());
            pstmt.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        finally {
            disconnect();
        }
        return true;
    }
}
