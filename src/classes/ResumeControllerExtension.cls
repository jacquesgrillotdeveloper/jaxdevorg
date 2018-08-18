public class ResumeControllerExtension {
    public ResumeControllerExtension(ApexPages.StandardController controller){
        
    }
    
    public List<Resume_Experience__c> EducationExperience = new Resume_Experience__c[]{};
        public List<Resume_Experience__c> getEducationExperience(){	                  
            EducationExperience = [SELECT Experience__r.Name, Experience__r.End__c FROM Resume_Experience__c WHERE Resume__r.id= :System.currentPageReference().getParameters().get('id') and Experience__r.RecordTypeId = '01261000000MXSIAA4' ORDER BY Experience__r.End__c DESC ];
            return EducationExperience;
        }
    
    public List<Resume_Experience__c> ProfessionalExperience = new Resume_Experience__c[]{};
        public List<Resume_Experience__c> getProfessionalExperience(){	                  
            ProfessionalExperience = [SELECT Experience__r.Name, Experience__r.End__c FROM Resume_Experience__c WHERE Resume__r.id= :System.currentPageReference().getParameters().get('id') and Experience__r.RecordTypeId = '01261000000MXSDAA4' ORDER BY Experience__r.End__c DESC ];
            return ProfessionalExperience;
        }
}