@isTest
public class TestDataFactory {
    // Pass through the number accounts needed to be created. Second Parameter is for the number of Opportunities per each Account
    public static List<Account> createAccountsWithOpps(Integer numAccts, Integer numOppsPerAcct) {
        //Instantiate an empty list of Accounts
        List<Account> accts = new List<Account>();
        
        //For loop to create the number of accounts specified
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        //Inser Accounts
        insert accts;
        
        //Instantiate an empty list of Opportunities
        List<Opportunity> opps = new List<Opportunity>();
        
        //For loop to create the opportunities
        for (Integer j=0;j<numAccts;j++) {
            Account acct = accts[j];
            // For each account just inserted, add opportunities
            for (Integer k=0;k<numOppsPerAcct;k++) {
                opps.add(new Opportunity(Name=acct.Name + ' Opportunity ' + k,
                                         StageName='Prospecting',
                                         CloseDate=System.today().addMonths(1),
                                         AccountId=acct.Id));
            }
        }
        // Insert all opportunities for all accounts.
        insert opps;
        
        return accts;
    }
}