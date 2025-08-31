@isTest

private class AccountOperationsTest {

    @isTest 

    static void testHighRevenueRating() {

        // Create test account with high revenue

        Account acc = new Account(

            Name = 'Test High Revenue Account',

            AnnualRevenue = 2000000
    

    @isTest 

    static void testSmallEmployeeCountRating() {

        // Arrange

        Account acc = new Account(

            Name = 'Test Small Company',

            NumberOfEmployees = 5

        );

        


        insert acc;

        

        Test.startTest();

        // Act

        Test.startTest();

        insert acc;

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        // Verify the rating was set to Hot

        Account savedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals('Hot', savedAcc.Rating, 'Account with high revenue should be rated Hot');
        // Assert

        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals('Cold', updatedAcc.Rating, 'Account with less than 10 employees should be rated Cold');

    }

    @isTest 

    static void testLowRevenueRating() {

        Account acc = new Account(

            Name = 'Test Low Revenue Account',

            AnnualRevenue = 500000
    static void testLargerEmployeeCountRating() {

        // Arrange

        Account acc = new Account(

            Name = 'Test Larger Company',

            NumberOfEmployees = 15

        );

        

        insert acc;

        

        Test.startTest();

        // Act

        Test.startTest();

        insert acc;

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        Account savedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals('Cold', savedAcc.Rating, 'Account with low revenue should be rated Cold');
        // Assert

        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals(null, updatedAcc.Rating, 'Account with more than 10 employees should have null rating');

    }

    @isTest 

    static void testNullRevenue() {

        Account acc = new Account(

            Name = 'Test Null Revenue Account'
    static void testNullEmployeeCount() {

        // Arrange

        Account acc = new Account(

            Name = 'Test Null Employee Count Account'

        );

        

        insert acc;

        

        Test.startTest();

        // Act

        Test.startTest();

        insert acc;

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        Account savedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals(null, savedAcc.Rating, 'Account with null revenue should have null rating');
        // Assert

        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals(null, updatedAcc.Rating, 'Account with null employee count should have null rating');

    }

}