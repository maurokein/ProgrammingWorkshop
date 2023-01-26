package tema5;
/**
 *
 * @author mauro
 */
public class Triangle extends Figure {
    private double firstSide;
    private double secondSide;
    private double thirdSide;
    
    public Triangle(double firstSide, double secondSide, double thirdSide, String innerColor, String lineColor){
        super(innerColor, lineColor);
        this.firstSide = firstSide;
        this.secondSide = secondSide;
        this.thirdSide = thirdSide;
    }
    
    public double [] getSides(){
        double [] sides = new double[3];
        sides[0] = firstSide;
        sides[1] = secondSide;
        sides[2] = thirdSide;
        return sides;
    }
    
    public void setSides(double firstSide, double secondSide, double thirdSide){
        this.firstSide = firstSide;
        this.secondSide = secondSide;
        this.thirdSide = thirdSide;
    }
    
    public void setSize(double firstSide, double secondSide, double thirdSide){
        this.firstSide = firstSide;
        this.secondSide = secondSide;
        this.thirdSide = thirdSide; 
    } 
    
    public double getSize(){
        return firstSide + secondSide + thirdSide;
    }
    
    @Override
    public double calculateArea(){
        double area = (double)((firstSide + secondSide + thirdSide) / 2);
        area = area * (area - firstSide) * (area - secondSide) * (area - thirdSide);
        area = Math.sqrt(area);
        return area; 
    }
    
    @Override
    public double calculatePerimeter(){
        return this.getSize();
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + " First Side: " + getSides()[0] + 
                     " | Second Side: " + getSides()[1] + 
                     " | Third Side: " + getSides()[2];
        return aux;
    }
}
