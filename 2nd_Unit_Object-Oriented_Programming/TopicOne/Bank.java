package tema1;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class Bank {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int [] options;
        options = new int[5];
        for(int i = 0; i < 5; i++){
            options[i] = 0;
        }
        System.out.println("Enter the operation you wish to do");
        System.out.println("1- Check cashing");
        System.out.println("2- Payment of taxes and services");
        System.out.println("3- Retirement charge");
        System.out.println("4- Payment of plans");
        System.out.println("5- Closing of the bank");
        int option = Lector.leerInt() - 1; 
        while(option != 4){
            options[option]++;
            System.out.println("Enter the operation you wish to do");
            option = Lector.leerInt() - 1;
        }
        for(int i = 0; i < 5; i++){
            System.out.println("The number of persons who did the operation " + (i + 1) + " was: " + options[i] + " persons");
        }
    }
}
