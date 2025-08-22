public class Calculatorclass { 
    public Double a;
    public Double b;
    public Double result;
    
    public  double sum( Double a, Double b)
        {
         result=a+b;
            system.debug(result);
            return result;
        }
    public  double sub( Double a, Double b)
    {
         result=a-b;
        system.debug(result);
          return result;
    }
     public  double mul( Double a, Double b)
     {
         result=a*b;
         system.debug(result);
           return result;
     }
     public double div( Double a, Double b)
     {
          result=a/b;
         system.debug(result);
           return result;
     }
        
  
}