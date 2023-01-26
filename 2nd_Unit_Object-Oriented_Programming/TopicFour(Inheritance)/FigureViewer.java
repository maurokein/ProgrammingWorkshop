package tema5;
/**
 *
 * @author mauro
 */
public class FigureViewer {
    private int displayed;
    
    public FigureViewer(){
        displayed = 0;
    }
    
    public void display(Figure f){
        System.out.println(f.toString());
        displayed++;
    }
    
    public int getDisplayed(){
        return displayed;
    }
}
