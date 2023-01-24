package tema3;
/**
 *
 * @author mauro
 */
public class Coach {
    private String name; 
    private double salary;
    private int cups; 
    
    public Coach(String name, double salary, int cups){
        this.name = name; 
        this.salary = salary;
        this.cups = cups; 
    }
    
    public Coach(){}
    
    public void setName(String name){
        this.name = name; 
    }
    
    public void setSalary(double salary){
        this.salary = salary;
    }
    
    public void setCups(int cups){
        this.cups = cups;
    }
    
    public String getName(){
        return name; 
    }
    
    public double getSalary(){
        return salary;
    }
    
    public int getCups(){
        return cups;
    }
    
    public double calculateSalaryToBeReceived(){
        double salary = 0, basic = getSalary();
        int cups = getCups();
        
        if(cups > 0){
            if(cups < 5){
                salary = basic + 5000;
            }else{
                if(cups <= 10){
                    salary = basic + 30000;
                }else{
                    salary = basic + 50000;
                }
            }
        }
        return salary;
    }
}
