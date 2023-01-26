package tema5;
/**
 *
 * @author mauro
 */
public class Rectangle extends Figure {
    private double base;
    private double height;
    
    public Rectangle(double base, double height, String innerColor, String lineColor){
        super(innerColor, lineColor);
        this.base = base; 
        this.height = height;
    }

    public double getBase() {
        return base;
    }

    public void setBase(double base) {
        this.base = base;
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }
    
    @Override
    public double calculateArea(){
        return getBase() * getHeight();
    }
    
    @Override
    public double calculatePerimeter(){
        return 2*getBase() + 2*getHeight();
    }
    
    @Override
    public String toString(){
        String str = super.toString() + " | Base: " + getBase() + " | Height: " + getHeight();
        return str;
    }
}
