/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

/**
 *
 * @author Texus
 */
public class RatingUtils {
    public static String generateRatingStars(int rating) {
        StringBuilder html = new StringBuilder();

        for (int i = 1; i <= 5; i++) {
            if (i <= rating) {
                html.append("<span class=\"fa fa-star checked fall\"></span>");
            } else {
                html.append("<span class=\"fa fa-star fall\"></span>");
            }
        }

        return html.toString();
    }
    
}
