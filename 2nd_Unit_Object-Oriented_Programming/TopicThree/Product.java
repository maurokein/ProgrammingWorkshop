package tema3;
/**
 *
 * @author mauro
 */
public class Product {
    private double weight; 
    private String description; 
    
    public Product(double weigth, String description){
        this.weight = weight; 
        this.description = description;
    }
    
    public Product(){}
    
    public double getWeight(){
        return weight;
    }
    
    public void setWeight(double weight){
        this.weight = weight;
    }
    
    public String getDescription(){
        return description;
    }
    
    public void setDescription(String description){
        this.description = description;
    }   
}
