@isTest

private class AccountOperationsTest {

    

    @isTest 

    static void testSmallEmployeeCountRating() {

        // Arrange

        Account acc = new Account(

            Name = 'Test Small Company',

            NumberOfEmployees = 5

        );

        

        // Act

        Test.startTest();

        insert acc;

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        // Assert

        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals('Cold', updatedAcc.Rating, 'Account with less than 10 employees should be rated Cold');

    }

    @isTest 

    static void testLargerEmployeeCountRating() {

        // Arrange

        Account acc = new Account(

            Name = 'Test Larger Company',

            NumberOfEmployees = 15

        );

        

        // Act

        Test.startTest();

        insert acc;

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        // Assert

        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals(null, updatedAcc.Rating, 'Account with more than 10 employees should have null rating');

    }

    @isTest 

    static void testNullEmployeeCount() {

        // Arrange

        Account acc = new Account(

            Name = 'Test Null Employee Count Account'

        );

        

        // Act

        Test.startTest();

        insert acc;

        AccountOperations.updateRating(acc);

        update acc;

        Test.stopTest();

        

        // Assert

        Account updatedAcc = [SELECT Rating FROM Account WHERE Id = :acc.Id];

        System.assertEquals(null, updatedAcc.Rating, 'Account with null employee count should have null rating');

    }

}