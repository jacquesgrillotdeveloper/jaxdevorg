@isTest
private class TestVerifyDate {
    // 'VerifyDate' is a class which tests if a date is within a proper range, and if not will return a date that occurs at the end of the month within the range.
    @isTest static void testCheckDatesWithin30 (){
        Date testWithin30Days  = VerifyDate.CheckDates(system.today(),system.today().addDays(15));
        System.assertEquals(system.today().addDays(15),testWithin30Days);
    }
    @isTest static void testCheckDatesOutside30 (){
        Date testOutside30Days  = VerifyDate.CheckDates(system.today(),system.today().addDays(45));
        System.assertNotEquals(system.today().addDays(45),testOutside30Days);
    }
}