package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class CircleInstantiation {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Enter the radius of the circle");
        double radius = Lector.leerDouble();
        String firstColor = "Blue", secondColor = "Red";
        
        Circle circle = new Circle(radius, firstColor, secondColor);
        
        System.out.println("The area of the instantiated circle is: " + circle.calcuteArea());
        
        System.out.println("The perimeter of thte instantiated circle is: " + circle.calculatePerimeter());   
    }   
}
