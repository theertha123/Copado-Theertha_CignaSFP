@isTest

public class AccountServiceTest {

    

    @isTest

    static void testCreateAccount() {

        // Test data

        String testName = 'Test Account';

        

        // Execute method

        Test.startTest();

        Account result = AccountService.createAccount(testName);

        Test.stopTest();

        

        // Verify results

        System.assertNotEquals(null, result.Id);

        System.assertEquals(testName, result.Name);

        

        // Verify database state

        List<Account> accounts = [SELECT Id FROM Account WHERE Name = :testName];

        System.assertEquals(1, accounts.size());

    }

    

    @isTest

    static void testGetAccountsByName() {

        // Test data setup

        String testName = 'Test Account';

        Account testAccount = new Account(Name = testName);

        insert testAccount;

        

        // Execute method

        Test.startTest();

        List<Account> results = AccountService.getAccountsByName(testName);

        Test.stopTest();

        

        // Verify results

        System.assertEquals(1, results.size());

        System.assertEquals(testName, results[0].Name);

    }

}