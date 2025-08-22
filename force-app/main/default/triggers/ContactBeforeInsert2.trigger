trigger ContactBeforeInsert2 on Contact (after insert) {
    for (contact con :Trigger.new){
        con.Description = 'record created successfully';
    }

}