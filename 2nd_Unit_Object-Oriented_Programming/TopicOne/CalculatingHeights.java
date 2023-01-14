package tema1;
import PaqueteLectura.Lector; 
/**
 *
 * @author mauro
 */
public class CalculatinHeights {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int vector [];
        vector = new int[15];
        int i, totalHeight = 0;

        for(i = 0; i < 15; i++) {
          System.out.println("Insert the player height in centimeters");
          int height = Lector.leerInt();
          vector[i] = height;
          totalHeight += height;
        }
        double average = totalHeight / 15;
        System.out.println("The average height calculated is: " + average);

        int greaterThanAverage = 0; 
        for(i = 0; i < 15; i++){
          if(vector[i] > average){
            greaterThanAverage++;
          }
        }
        System.out.println("The player quantity that exceeds the average height is: " + greaterThanAverage);
    }
}
