/***********************************************************************
 * This trigger is to fire when an Attachment is added 
 * to a Training Article "Sftrn_Article__c"
 * 2/21/2017 - Currently designed to only hand 1 attachment at a time
 * *********************************************************************/
trigger sftrnSetUrlToAttachment on Attachment (after insert) {
    // Declare Attachment record Id
    Id attachmentId;
    // Declare Parent Object Id (sftrn_Article__c)
    Id parentObjectId;
    
    // For loop for the Attachment Trigger - declare Attachment as att for the Trigger.new
    for(Attachment att: Trigger.new){
        // Set attachmentId to the Id of the new attachment
        attachmentId = att.Id;
        // Set the parentObjectId of the Parent Id of the new attachment
        parentObjectId = att.ParentId;
    }
    
    // Declare a list for "sftrn_Article__c"  to return values with the Parent Id that was instantiated
    List<Sftrn_Article__c> sa =[select Id , Link__c from Sftrn_Article__c where Id=:parentObjectId];
    
    // If statement to check List size is 1
    if (sa.size()==1)
    {
        //assuming one record is fetched, go to "0" position record
        //set the Link URL for the attachment using the attachmentId and URL information
        sa[0].Link__c=System.URL.getSalesforceBaseURL().toExternalform()+'/servlet/servlet.FileDownload?file='+attachmentId;
        
        // Update the Salesforce record
        update sa[0];
    }
    else {
        // Debug error when more than 1 attachment was uploaded to the record
        System.debug('Error: ' + sa.size() + ' attachments were uploaded');
    }
    
}