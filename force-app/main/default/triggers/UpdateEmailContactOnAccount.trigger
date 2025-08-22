trigger UpdateEmailContactOnAccount on Account (after update) {
      if(trigger.isUpdate){ 

        UpadteContactEmailHandler.updateContactEmailAddress(trigger.new,trigger.oldMap); 

    } 

}