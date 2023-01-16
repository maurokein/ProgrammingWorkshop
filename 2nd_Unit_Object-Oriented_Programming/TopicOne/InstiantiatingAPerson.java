package tema2;
import PaqueteLectura.Lector; 
/**
 *
 * @author mauro
 */
public class InstantiatingAPerson {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Person firstPerson = new Person();
        System.out.println("Enter the name of the person");
        String name = Lector.leerString();
        firstPerson.setName(name);
        System.out.println("Enter the age of the person");
        int age = Lector.leerInt();
        firstPerson.setAge(age);
        System.out.println("Enter the id of the person");
        int id = Lector.leerInt();
        firstPerson.setID(id);
        
        System.out.println(firstPerson.toString());
        
    }   
}
