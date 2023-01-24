package tema3;
/**
 *
 * @author mauro
 */
public class TradeBalance {
    private double amount; 
    private int items; 
    private String summary; 
    
    public TradeBalance(double amount, int items){
        this.amount = amount;
        this.items = items; 
    }
    public TradeBalance(){}
    
    public void initializePurchase(){
        amount = 0; 
        items = 0;
        summary = "";
    }
    
    public void registerProduct(Product product, double price){
        price *= product.getWeight();
        amount += price;
        items++;
        summary += product.getDescription() + price;
    };
    
    public double returnAmountToPay(){
        return amount;
    }
    
    public String returnPurchaseSummary(){
        String str1, str2;
        str1 = "Total to pay: " + amount;
        str2 = " for the purchase of: " + items + " products.";
        return summary + str1 + str2;
    }
}
