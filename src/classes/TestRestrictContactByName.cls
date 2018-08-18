//	'RestrictContactByName' is a trigger which blocks inserts and updates to any contact with a last name of 'INVALIDNAME'.
//	Requires 100% code coverage
@isTest
private class TestRestrictContactByName {  
    @isTest static void  TestRestrictContactByName(){
        List<Contact> listContact= new List<Contact>();
        
        Contact c1 = new Contact(FirstName='Jacques', LastName='Grillot' , email='Test@test.com');
        Contact c2 = new Contact(FirstName='Jamie', LastName = 'INVALIDNAME',email='Test2@test.com');
        
        listContact.add(c1);
        listContact.add(c2);
        
        Test.startTest();
        try {
            insert listContact;
        }
        catch(Exception e){}
        
        Test.stopTest(); 
    }
}