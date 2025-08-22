public class Upacc {
    public  void upbranch(){
        list<Account> BranchAcc = new list<Account>();
        for(Account  acc:[select Name,Id,Rating,Main_Branch__c from Account where Main_Branch__c=True])
        {
           if(acc.Rating =='Hot')
            {
                acc.Rating = 'cold';
            }
            else{
                acc.Rating = 'Hot';
            }
            
            BranchAcc.add(acc);
        }
        update BranchAcc;
    }

}