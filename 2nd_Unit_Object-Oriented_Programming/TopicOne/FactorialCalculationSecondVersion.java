package tema1;

import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class FactorialCalculationSecondVersion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       int factorial = 0;  
       System.out.println("Please select an option");
       System.out.println("1 - Print factorial number from 1 to 9");
       System.out.println("2 - Print factorial number of odd number from 1 to 9");
       int option = Lector.leerInt();
       
       while(option != 1 &&2 option != 2){
           System.out.println("The option selected is incorrect. Please try 1 or 2");
           option = Lector.leerInt();
       }
       if(option == 1){
            for(int i = 1; i < 10; i++){
            System.out.println("The factorial of the number: " + i + " is equal to: " + calculateTheFactorial(i, factorial));
            }
        }else{
            for(int j = 1; j < 10;){
                    System.out.println("The factorial of the number: " + j + " is equal to: " + calculateTheFactorial(j, factorial));
                    j = j + 2;
            }          
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
