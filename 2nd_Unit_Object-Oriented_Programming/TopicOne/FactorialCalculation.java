package tema1;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class FactorialCalculation {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Disclaimer: for close this console program, please enter a 0 (zero) number.");
        System.out.println("Ok, you´re still here. So...");
        System.out.println("Insert a number (greater than zero) to calculate his factorial"); 
        int number = Lector.leerInt();
        int factorial = 0;
        while(number != 0){
            if(number < 0){
                System.out.println("The number entered must be greater than zero. Please try again");
                System.out.println("Insert another number with same conditions to calculate his factorial (or 0 to finish)"); 
                number = Lector.leerInt();
            }else{
                System.out.println("The factorial result of the number entered is: " + calculateTheFactorial(number, factorial));
                System.out.println("***");
                System.out.println("Insert another number with same conditions to calculate his factorial (or 0 to finish)"); 
                number = Lector.leerInt();
            }
        }
        if(number == 0){
            System.out.println("The program has finished. See you later!");
        }
    }
    public static int calculateTheFactorial(int number, int factorialCounter){
        if(number == 0){
            factorialCounter = 1;
        }else{
            factorialCounter = number * calculateTheFactorial(number - 1, factorialCounter);
        }
        return factorialCounter;
    }       
}
