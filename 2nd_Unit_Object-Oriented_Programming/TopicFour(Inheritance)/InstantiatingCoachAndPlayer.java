package tema5;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class CoachesAndPlayersInstantiation {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
            System.out.println("Enter the name of the coach");
            String coachName = Lector.leerString();
            System.out.println("Enter the basic salary of the coach");
            double coachSalary = Lector.leerDouble();
            System.out.println("Enter the championships won by the coach");
            int coachCups = Lector.leerInt();
            
            Coach c = new Coach(coachName, coachSalary, coachCups);
            
            System.out.println("Enter the name of the player");
            String playerName = Lector.leerString();
            System.out.println("Enter the basic salary of the player");
            double playerSalary = Lector.leerDouble();     
            System.out.println("Enter the games played by the player");
            int playerGames = Lector.leerInt();
            System.out.println("Enter the goals converted by the player");
            int playerGoals = Lector.leerInt();
            
            Player p = new Player(playerName, playerSalary, playerGames, playerGoals);
            
            System.out.println("The salary of the coach will be of: US$" + c.calculateSalary());
            System.out.println("The salary of the player will be of: US$" + p.calculateSalary());
            
            System.out.println(c.toString());
            System.out.println(p.toString());
    }
}
