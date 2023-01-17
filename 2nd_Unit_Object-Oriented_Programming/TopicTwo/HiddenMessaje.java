package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class HiddenMessage {

    /**
     * @param args the command line arguments
     Test this program with following strings: hidden echo light luck oracle wide omicron run lift day 
     The hidden words are: helloworld
     */
    public static void main(String[] args) {
        String [] vector = new String[10];
        for(int i = 0; i < 10; i++){
            System.out.println("Enter a string");
            vector[i] = Lector.leerString();
        }
        for(int j = 0; j < 10; j++){
            System.out.print(vector[j].charAt(0) + "");
        }
    }
}
