public class NewCaseListController {
    
    list<Case> NewCases;
    
    public List <Case> getNewCases() 
    {
        NewCases = [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];
        return NewCases;
    }
    
}