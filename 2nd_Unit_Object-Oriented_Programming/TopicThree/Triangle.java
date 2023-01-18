package tema3;
/**
 *
 * @author mauro
 */
public class Triangle {
    private double firstSide;
    private double secondSide;
    private double thirdSide;
    private String innerColor;
    private String lineColor; 
    
    public Triangle(double firstSide, double secondSide, double thirdSide, String innerColor, String lineColor){
        this.firstSide = firstSide;
        this.secondSide = secondSide;
        this.thirdSide = thirdSide;
        this.innerColor = innerColor;
        this.lineColor = lineColor;
    }
    
    public Triangle(){}
    
    public void setSize(double firstSide, double secondSide, double thirdSide){
        this.firstSide = firstSide;
        this.secondSide = secondSide;
        this.thirdSide = thirdSide; 
    }
    
    public void setInnerColor(String color){
        innerColor = color;
    }
    
    public void setLineColor(String color){
        lineColor = color;
    }
    
    public double getSize(){
        return firstSide + secondSide + thirdSide;
    }
    
    public String getInnerColor(){
        return innerColor;
    }
    
    public String getLineColor(){
        return lineColor;
    }
    
    public double calculateArea(double firstSide, double secondSide, double thirdSide){
        double area = (double)((firstSide + secondSide + thirdSide) / 2);
        area = area * (area - firstSide) * (area - secondSide) * (area - thirdSide);
        area = Math.sqrt(area);
        return area; 
    }
    
    public double calculatePerimeter(double firstSide, double secondSide, double thirdSide){
        return this.getSize();
    }
}
