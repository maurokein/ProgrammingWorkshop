package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class Casting {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int days = 5, dailyTurns = 8;
        Person [][] timeline = new Person[days][dailyTurns];
        int i = 0, j = 0; 
        int total = 0; 
        System.out.println("Insert the name of the cast person");//Simulate the anotation to the casting 
        String name = Lector.leerString();
        while(!name.equals("ZZZ") && total < 40){
            timeline[i][j] = new Person();
            timeline[i][j].setName(name);
            System.out.println("Insert the age of the cast person");
            int age = Lector.leerInt();
            System.out.println("Insert the id of the cast person");
            int id = Lector.leerInt();
            timeline[i][j].setAge(age);
            timeline[i][j].setID(id);
            total++;
            if(j == 7) {
                j = 0;
                i++;       
            }
            else{
                j++;                
            }
            System.out.println("Insert the name of the cast person"); 
            name = Lector.leerString();
        }   
        
        for(i = 0; i < 5; i++){//Show registered people 
            for(j = 0; j < 8; j++){
                if(timeline[i][j] != null){
                    System.out.println("On day: " + (i + 1) + " | Orderly turn: " + (j + 1) + " the name of person to cast is: " + timeline[i][j].getName());
                }else{
                    System.out.println("On day: " + (i + 1) + " | Orderly turn: " + (j + 1) + " there´s no person to cast");
                
            }
            }
        }
    }
}
