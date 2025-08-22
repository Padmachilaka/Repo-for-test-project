public class QueuableDemo implements Queueable{
    public void execute(QueueableContext context){
        Account acc = new Account(Name='Isha',Phone='1234567890');
        insert acc;
        System.debug('Inserted');
        System.enqueueJob(new QueueClass2(),1);
    }
}