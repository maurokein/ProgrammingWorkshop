package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class CoachInstantiation {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        String name; 
        double salary;
        int cupsWon; 
        
        System.out.println("Enter the name of the coach");
        name = Lector.leerString();
        System.out.println("Enter the salary of the coach");
        salary = Lector.leerDouble();
        System.out.println("Enter the number of cups won");
        cupsWon = Lector.leerInt();
        
        Coach coach = new Coach(name, salary, cupsWon);
        
        double testData = coach.calculateSalaryToBeReceived();
        System.out.println("The salary to be received by the coach is: " + testData);
    }
}
