package tema5;
/**
 *
 * @author mauro
 */
public class Coach extends Employee {
    private int championshipsWon;
    
    public Coach(String name, double salary, int championshipsWon){
        super(name, salary);
        this.championshipsWon = championshipsWon;
    }

    public int getChampionshipsWon() {
        return championshipsWon;
    }

    public void setChampionshipsWon(int championshipsWon) {
        this.championshipsWon = championshipsWon;
    }
    
    public double calculateSalary(){
        double basicSalary = getSalary();
        int cups = getChampionshipsWon();
        if(cups == 0){
            return basicSalary;
        }else{
            if(cups > 0 && cups < 5){
                return basicSalary + 5000;
            }else{
                if(cups > 4 && cups <= 10){
                    return basicSalary + 30000;
                }else{
                    return basicSalary + 50000;
                }
            }
        }
    }
}
