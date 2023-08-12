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

public class Author {

    private int authorId;
    private String authorName;
    private String contactNum;
    private String authorEmail; // New field for publication date
    private byte[] imageBytes;
    private String about;

    public Author(int authorId, String authorName,String contactNum,String authorEmail, byte[] imageBytes,String about ) {
        this.authorId = authorId;
        this.authorName = authorName;
        this.contactNum = contactNum;
        this.authorEmail = authorEmail;
        this.imageBytes = imageBytes;
        this.about = about;
      
    }

    public int getAuthorId() {
        return authorId;
    }

    public String getAuthorName() {
        return authorName;
    }
    
    public String getContactNum() {
        return contactNum;
    }
    
    public String getAuthorEmail() {
        return authorEmail;
    }
    
    public byte[] getImageBytes() {
        return imageBytes;
    }
    
    public String getAuthorAbout() {
        return about;
    }

    
}
