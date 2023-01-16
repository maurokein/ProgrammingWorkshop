package tema2;
/**
 *
 * @author mauro
 */
public class Person {
    private String name; 
    private int ID; 
    private int age; 
    
    public Person(String aName, int anID, int anAge){
        name = aName;
        ID = anID;
        age = anAge; 
    }
    
    public Person(){}
    
    public int getID(){
        return ID;
    }
    
    public int getAge(){
        return age; 
    }
    
    public String getName(){
        return name;
    }
    
    public void setID(int anID){
        ID = anID;
    }
    
    public void setAge(int anAge){
        age = anAge;
    }
    
    public void setName(String aName){
        name = aName;
    }
    
    public String toString(){
        return "My name is: " + name + ", my ID is: " + ID + " and I am " + age + " years old";
    }
}
