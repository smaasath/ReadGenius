/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author Texus
 */
import java.util.Date;

public class User {

    private int userId;
    private String userName;
    private String Password;
    private int readerId; // New field for publication date
   

    public User(int userId, String userName,String Password,int readerId) {
        this.userId = userId;
        this.userName = userName;
        this.Password = Password;
        this.readerId = readerId;
       
      
    }

    public int getUserId() {
        return userId;
    }

    public String getUserName() {
        return userName;
    }
    
    public String getPassword() {
        return Password;
    }
    
    public int getReaderId() {
        return readerId;
    }
    
    

    
}
