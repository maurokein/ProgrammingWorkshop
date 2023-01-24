package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author mauro
 */
public class BalanceAndPurchase {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        TradeBalance balance = new TradeBalance();
        
        balance.initializePurchase();
        
        System.out.println("Insert the weight of the product");
        double weight = Lector.leerDouble();
        while(weight != 0){
            System.out.println("Insert the price of the product");
            double price = Lector.leerDouble();
            System.out.println("Insert a product description");
            String description = Lector.leerString();
            Product p = new Product(price, description);
            balance.registerProduct(p, price);
            System.out.println("Insert the weight of the next product");
            weight = Lector.leerDouble();
        }
        
        balance.returnPurchaseSummary();        
    }    
}
