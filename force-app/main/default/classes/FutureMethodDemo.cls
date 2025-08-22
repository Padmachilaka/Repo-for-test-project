public   Class FutureMethodDemo{
    
    public FutureMethodDemo(){
     method1();
     method2();
     method3(); 
    }
    public static void method1(){
        system.debug('I have done My Assignment 1');
        list<Account> acclist=[SELECT Id FROM account limit 120];
        system.debug('size of list'+acclist.size());
        for(Account acc: acclist)
        {
            account acc1=[SELECT Id FROM account limit 1];
        }
    }
    @Future
    public static void method2(){
        system.debug('I havet completed my second assignment');
    }
    public static void method3(){
        Account acc = [SELECT Id FROM account limit 1];
        system.debug('I will complete by today');
    }
    
}