package tema5;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class InstantiatingFigures {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("Enter the side dimension");
        double side = Lector.leerDouble();
        System.out.println("Enter an inner color");
        String innerColor = Lector.leerString();
        System.out.println("Enter a line color");
        String lineColor = Lector.leerString();
        
        Square s = new Square(side, innerColor, lineColor);
        
        System.out.println("Enter the size of first side");
        double firstTriangleSide = Lector.leerDouble();
        System.out.println("Enter the size of second side");
        double secondTriangleSide = Lector.leerDouble();
        System.out.println("Enter the size of third side");
        double thirdTriangleSide = Lector.leerDouble();
        System.out.println("Enter the inner color of the triangle");
        String innerTriangleColor = Lector.leerString();
        System.out.println("Enter the line color of the triangle");
        String lineTriangleColor = Lector.leerString();
        
        Triangle t = new Triangle(firstTriangleSide, secondTriangleSide, thirdTriangleSide, innerTriangleColor, lineTriangleColor);
        
        System.out.println("The square area is: " + s.calculateArea() + " and its perimeter is: " + s.calculatePerimeter());
        System.out.println("The triangle area is: " + t.calculateArea() + " and its perimeter is: " + t.calculatePerimeter());
        System.out.println(s.toString());
        System.out.println(t.toString());
    }
}
