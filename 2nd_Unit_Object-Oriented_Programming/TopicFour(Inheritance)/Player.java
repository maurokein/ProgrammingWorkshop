package tema5;
/**
 *
 * @author mauro
 */
public class Player extends Employee {
    private int games; 
    private int goals; 
    
    public Player(String name, double salary, int games, int goals){
        super(name, salary);
        this.games = games;
        this.goals = goals;
    }

    public int getGames() {
        return games;
    }

    public void setGames(int games) {
        this.games = games;
    }

    public int getGoals() {
        return goals;
    }

    public void setGoals(int goals) {
        this.goals = goals;
    }
    
    public double calculateSalary(){
        double basicSalary = getSalary();
        double average = (double)getGoals() / getGames();
        if(average > 0.50){
            return basicSalary * 2;
        }else{
            return basicSalary; 
        }
    }
}
