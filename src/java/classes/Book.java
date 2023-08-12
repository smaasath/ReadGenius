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

public class Book {

    private int bookId;
    private String isbn;
    private String title;
    private Date publicationDate; // New field for publication date
    private String category;
    private String Description;
    private byte[] imageBytes;
    private int authorId;

    public Book(int bookId, String isbn,String title,Date publicationDate,String category,String Description, byte[] imageBytes, int authorId ) {
        this.bookId = bookId;
        this.isbn = isbn;
        this.title = title;
        this.publicationDate = publicationDate;
        this.category = category;
        this.Description = Description;
        this.imageBytes = imageBytes;
        this.authorId = authorId;
      
    }

    public int getBookId() {
        return bookId;
    }

    public String getTitle() {
        return title;
    }
    
    public String getIsbn() {
        return isbn;
    }
    
    public Date getPublicationDate() {
        return publicationDate;
    }
    
    public String getCategory() {
        return category;
    }
    
    public String getDescription() {
        return Description;
    }
    
    public byte[] getImageBytes() {
        return imageBytes;
    }
    
    public int getAuthorId() {
        return authorId;
    }

    
}
