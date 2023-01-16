package tema1;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class Offices {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int [][] building = new int[8][4];
        //initializing the number of persons in each bulding with zero 
        int i, j;
        for(i = 0; i < 8; i++){
            for(j = 0; j < 4; j++){
                building[i][j]= 0;
            }
        }
        System.out.println("Enter the floor you wish to go to");
        int floor = Lector.leerInt() - 1; 
        while(floor < 8){
            System.out.println("Indicate which office you are going to");
            int office = Lector.leerInt() - 1; 
            building[floor][office]++;
            System.out.println("Enter the floor you wish to go to");
            floor = Lector.leerInt() - 1;
        }
        
        //informing the number of people who assisted at each office 
        for(i = 0; i < 9; i++){
            for(j = 0; j < 4; j++){
                System.out.println("The number of persons who arrived to floor: " + (i + 1) + " office: " + (j + 1) + " was: " + building[i][j]);
            }
        }
    }   
}
