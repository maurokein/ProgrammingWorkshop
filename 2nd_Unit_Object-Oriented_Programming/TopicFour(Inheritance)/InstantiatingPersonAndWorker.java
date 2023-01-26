package tema5;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class PersonAndWorkerInstantiation {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Entet the name of the person");
        String personName = Lector.leerString();
        System.out.println("Enter the ID of the person");
        int personId = Lector.leerInt();
        System.out.println("Enter the age of the person");
        int personAge = Lector.leerInt();
        
        Person p = new Person(personName, personId, personAge);
        
        System.out.println("Enter the name of the worker");
        String workerName = Lector.leerString();
        System.out.println("Enter the ID of the worker");
        int workerId = Lector.leerInt();
        System.out.println("Enter the age of the worker");
        int workerAge = Lector.leerInt();
        System.out.println("Enter the job that worker realized into the property");
        String job = Lector.leerString();
        
        Worker w = new Worker(workerName, workerId, workerAge, job);
        
        System.out.println(p.toString());
        System.out.println(w.toString());
    }
}
