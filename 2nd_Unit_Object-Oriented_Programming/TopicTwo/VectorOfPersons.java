package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class VectorOfPersons {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Person [] vector = new Person[15];
        for(int i = 0; i < 15; i++){
            vector[i] = new Person();
            System.out.println("Enter the name");
            String name = Lector.leerString();
            System.out.println("Enter the id");
            int id = Lector.leerInt();
            System.out.println("Enter the age");
            int age = Lector.leerInt(); 
            vector[i].setName(name);
            vector[i].setAge(age);
            vector[i].setID(id);
        }
        
        int qua = 0;
        int min = Integer.MAX_VALUE;
        int index = 0; 
        for(int i = 0; i < 15; i++){
            if(vector[i].getAge() > 65){
                qua++;
            }
            if(vector[i].getID() < min){
                min = vector[i].getID();
                index = i;
            }
        }
        System.out.println("The number of persons greater than 65 years old is: " + qua);
        System.out.println("Representation of the person with the lowest id is: " + vector[index].toString());
    }
}
