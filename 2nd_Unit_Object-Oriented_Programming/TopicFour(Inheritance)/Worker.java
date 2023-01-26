package tema5;
/**
 *
 * @author mauro
 */
public class Worker extends Person {
    private String job;
    
    public Worker(String name, int id, int age, String job){
        super(name, id, age);
        this.job = job; 
    }
    
    public void setJob(String job){
        this.job = job; 
    }
    
    public String getJob(){
        return job;
    }
    
    public String toString(){
        String str = super.toString() + ". I am " + job;
        return str;
    }
}
