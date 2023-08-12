/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author Texus
 */


public class Reader {

    private int readerId;
    private String readerName;
    private String readerEmail;
    private byte[] imageBytes;


    public Reader(int readerId, String  readerName,String readerEmail, byte[] imageBytes) {
        this.readerId= readerId;
        this.readerName = readerName;
        this.readerEmail = readerEmail;
        this.imageBytes = imageBytes;
  
      
    }

    public int getReaderId() {
        return readerId;
    }

    public String getReaderName() {
        return readerName;
    }
    
    public String getReaderEmail() {
        return readerEmail;
    }
    
    public byte[] getImageBytes() {
        return imageBytes;
    }
    


    
}
