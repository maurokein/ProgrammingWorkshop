package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class VectorOfMatches {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Match[] vector = new Match[20];
        int total = 0; 
        System.out.println("Enter the local team");
        String local = Lector.leerString();
        System.out.println("Enter the visitor team");
        String visitor = Lector.leerString();
        while(!visitor.equals("ZZZ") && total < 20){
            System.out.println("Enter local goals");
            int localGoals = Lector.leerInt();
            System.out.println("Insert visitor goals");
            int visitorGoals = Lector.leerInt();
            vector[total] = new Match(local, visitor, localGoals, visitorGoals);
            total++;
            System.out.println("Enter the local team");
            local = Lector.leerString();
            System.out.println("Enter the visitor team");
            visitor = Lector.leerString();
        }
        int riverWins = 0, bocaGoals = 0, draws = 0;
        for(int i = 0; i < total; i++){
            if(vector[i].getWinner().equals("River")){
                riverWins++;
            }
            if(vector[i].getLocal().equals("Boca")){
                bocaGoals += vector[i].getLocalGoals();
            }
            if(vector[i].thereIsDraw()){
                draws++;
            }
        }
        System.out.println("Matches won by River Plate: " + riverWins);
        System.out.println("Local goals of Boca Juniors: " + bocaGoals);
        System.out.println("Draws percentage: " + (draws * 100) / total + "%");
    }   
}
