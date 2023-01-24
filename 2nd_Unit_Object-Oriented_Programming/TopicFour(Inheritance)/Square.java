package tema5;
/**
 *
 * @author mauro
 */
public class Square extends Figure {
    private double side;
    
    public Square(double aSide, String anInnerColor, String aLineColor){
        super(anInnerColor, aLineColor);
        setSide(aSide);
    }

    public double getSide() {
        return side;
    }

    public void setSide(double side) {
        this.side = side;
    }
    
    @Override
    public double calculateArea(){
        return getSide() * getSide();
    }
    
    @Override
    public double calculatePerimeter(){
        return getSide() * 4;
    }
    
    @Override
    public String toString(){
        String aux = super.toString() + " Side: " + getSide();
        return aux;
    }
}
