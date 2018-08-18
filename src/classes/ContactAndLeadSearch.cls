/* With SOSL you can search against different object types that may have similar data, such as contacts and leads. 
 * To pass this challenge, create an Apex class that returns both contacts and leads that have first or last name matching the incoming parameter.
*	The Apex class must be called 'ContactAndLeadSearch' and be in the public scope.
*	The Apex class must have a public static method called 'searchContactsAndLeads'.
*	Because SOSL indexes data for searching, you must create a Contact record and Lead record before checking this challenge. 
*		Both records must have the last name 'Smith'. The challenge uses these records for the SOSL search.
*	The return type for 'searchContactsAndLeads' must be 'List<List< SObject>>'
*	The 'searchContactsAndLeads' method must accept an incoming string as a parameter, find any contact or lead that matches the string as part of either the 
*		first or last name and then return those records.
*/
public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads (string searchName){
        List<List<SObject>> contactsAndLeads = [FIND :searchName IN NAME FIELDS RETURNING Contact, Lead];
        return contactsAndLeads;
    }
}