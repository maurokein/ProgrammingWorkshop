package tema2;
/**
 *
 * @author mauro
 */
public class Match {
    private String local; 
    private String visitor; 
    private int localGoals;
    private int visitorGoals; 
    
    public Match(){}
    
    public Match(String aLocal, String aVisitor, int aLocalGoal, int aVisitorGoal){
        local = aLocal;
        visitor = aVisitor; 
        localGoals = aLocalGoal;
        visitorGoals = aVisitorGoal;
    }
    
    public String getLocal(){
        return local; 
    }
    
    public String getVisitor(){
        return visitor; 
    }
    
    public int getLocalGoals(){
        return localGoals;
    }
    
    public int getVisitorGoals(){
        return visitorGoals;
    }
    
    public void setLocal(String aTeam){
        local = aTeam;
    }
    
    public void setVisitor(String aTeam){
        visitor = aTeam;
    }
    
    public void setLocalGoals(int aFewGoals){
        localGoals = aFewGoals;
    }
    
    public void setVisitorGoals(int aFewGoals){
        visitorGoals = aFewGoals; 
    }
    
    public boolean thereIsWinner(){
        return (localGoals != visitorGoals);
    }
    
    public boolean thereIsDraw(){
        return (localGoals == visitorGoals);
    }
    
    public String getWinner(){
        String winner = new String();
        if(localGoals > visitorGoals){
            winner = local;
        }else{
            if(localGoals < visitorGoals){
                winner = visitor;
            }
        }
        return winner;
    }
}
