package tema5;
/**
 *
 * @author mauro
 */
public abstract class Figure {
    private String innerColor;
    private String lineColor;

    
    public Figure(String anInnerColor, String aLineColor){
        this.setInnerColor(anInnerColor);
        this.setLineColor(aLineColor);
    }
    public String getInnerColor() {
        return innerColor;
    }

    public void setInnerColor(String innerColor) {
        this.innerColor = innerColor;
    }

    public String getLineColor() {
        return lineColor;
    }

    public void setLineColor(String lineColor) {
        this.lineColor = lineColor;
    }
    
    public String toString(){
        String aux = "Area: " + this.calculateArea() + 
                     " | Inner Color: " + this.getInnerColor() + 
                     " | Line Color: " + this.getLineColor();
        return aux;
    }

    public abstract double calculateArea();
    public abstract double calculatePerimeter();
}
