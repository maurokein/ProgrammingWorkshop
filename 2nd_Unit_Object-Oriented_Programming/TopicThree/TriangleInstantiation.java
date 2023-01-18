package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class TriangleInstantiation {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Triangle triangle;
        System.out.println("Enter the size of the first side");
        double firstSide = Lector.leerDouble();
        System.out.println("Enter the size of the second side");
        double secondSide = Lector.leerDouble();
        System.out.println("Enter the size of the third side");
        double thirdSide = Lector.leerDouble();
        System.out.println("Enter the inner color");
        String innerColor = Lector.leerString();
        System.out.println("Enter the line color");
        String lineColor = Lector.leerString();
        
        triangle = new Triangle(firstSide, secondSide, thirdSide, innerColor, lineColor);
        
        System.out.println("The perimeter of the created triangle is: " + triangle.calculatePerimeter(firstSide, secondSide, thirdSide));
        System.out.println("The area of the created triangle is: " + triangle.calculateArea(firstSide, secondSide, thirdSide));
    }
}
