package tema5;
/**
 *
 * @author mauro
 */
public abstract class Employee {
    private String name;
    private double salary;
    
    public Employee(String name, double salary){
        this.name = name;
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }
    
    public String toString(){
        String str = "Name: " + name + " | Basic Salary: " + salary;
        return str;
    }
    
    public abstract double calculateSalary();
}
