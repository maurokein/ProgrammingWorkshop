package tema5;
/**
 *
 * @author mauro
 */
public class PrintingFigures {
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        FigureViewer fv = new FigureViewer();
        
        Square s1 = new Square(10, "Violet", "Pink");
        Rectangle r = new Rectangle(20, 10, "Blue", "LightBlue");
        Square s2 = new Square(30, "Red", "Orange");
        
        fv.display(s1);
        fv.display(r);
        fv.display(s2);
        
        System.out.println(fv.getDisplayed());

    }   
}
