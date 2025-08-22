public class Fibonacciseries {
    public string generatefibonacciseries(Integer num){
        String fibonacciseries='fibonacci series :';
        Integer f1=0, f2=1, nextnum=0;
        for(Integer i=0; i<=num; i++){
              nextnum=f1+f2;
            f1=f2;
            f2=nextnum;
            fibonacciseries +=','+String.ValueOf(nextnum);
        }
      
          return fibonacciseries;
    }
    
}