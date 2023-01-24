package tema3;
/**
 *
 * @author mauro
 */
public class Circle {
    private double radius;
    private String filler; 
    private String line;
    
    Circle(double radius, String filler, String line){
        this.radius = radius;
        this.filler = filler;
        this.line = line;
    }
    
    Circle(){}

    public double getRadius() {
        return radius;
    }

    public void setRadius(double radius) {
        this.radius = radius;
    }

    public String getFiller() {
        return filler;
    }

    public void setFiller(String filler) {
        this.filler = filler;
    }

    public String getLine() {
        return line;
    }

    public void setLine(String line) {
        this.line = line;
    }
    
    public double calcuteArea(){
        return Math.PI * this.getRadius() * this.getRadius();
    }
    
    public double calculatePerimeter(){
        return Math.PI * 2 * this.getRadius();
    }
}
