/************************************************************
* Controller Extension for the Module Apex page 
* for attaching an icon
* 2/21/2017 - Class created								
* *********************************************************/
public class SftrnModuleControllerExtension {
    // Declare final variable for Module
    private final Sftrn_Module__c module;
    // Declare controller
    private ApexPages.StandardController stdController;
    // Declare a blob for icon
    public blob icon { get; set; }
    // Declare a string for any error message
    public String errorMessage { get; set; }
    
    // Getting the Sftrn_Module__c record for this extension
    public SftrnModuleControllerExtension(ApexPages.StandardController stdController) {
        this.module = (Sftrn_Module__c)stdController.getRecord();
        this.stdController = stdController;
    }
    
    public PageReference save() {
        errorMessage = '';
        try {
            // Try to upsert the module record
            upsert module;
            // if Icon is not null
            if (icon != null) {
                Attachment attachment = new Attachment();
                attachment.body = icon;
                attachment.name = 'module_' + module.id + '.jpg';
                attachment.parentid = module.id;
                // converts blob attachment to jpg
                attachment.ContentType = 'application/jpg';
                insert attachment;
                module.Icon_Path__c = '/servlet/servlet.FileDownload?file=' + attachment.id;
                update module;
            }
            return new ApexPages.StandardController(module).view();
        } 
        // Catch any system exceptions
        catch(System.Exception ex) {
            errorMessage = ex.getMessage();
            return null;
        }
    }
}