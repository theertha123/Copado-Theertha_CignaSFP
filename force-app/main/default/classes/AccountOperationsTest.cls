@isTest

private class AccountOperationsTest {

    @isTest 

    static void testHighRevenueRating() {

        // Create test account with high revenue

        Account acc = new Account(

            Name = 'Test High Revenue Account',

            AnnualRevenue = 2000000

        );

        

        insert acc;

        

        Test.startTest();

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        // Verify the rating was set to Hot

        Account savedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals('Hot', savedAcc.Rating, 'Account with high revenue should be rated Hot');

    }

    @isTest 

    static void testLowRevenueRating() {

        Account acc = new Account(

            Name = 'Test Low Revenue Account',

            AnnualRevenue = 500000

        );

        

        insert acc;

        

        Test.startTest();

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        Account savedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals('Cold', savedAcc.Rating, 'Account with low revenue should be rated Cold');

    }

    @isTest 

    static void testNullRevenue() {

        Account acc = new Account(

            Name = 'Test Null Revenue Account'

        );

        

        insert acc;

        

        Test.startTest();

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        Account savedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals(null, savedAcc.Rating, 'Account with null revenue should have null rating');

    }

}