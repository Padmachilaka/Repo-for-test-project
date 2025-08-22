public class ClassB implements Queueable{
    public void execute(QueueableContext context){
       Account acc = new Account(Name='ABC', Description='Electronics');
        Insert acc;
        system.debug('Inserted');
        system.enQueueJob(new QueueClass2(),1);
    }

}