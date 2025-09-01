public class AccountService {

    

    public static Account createAccount(String accountName) {

        Account newAccount = new Account(

            Name = accountName

        );

        

        insert newAccount;

        return newAccount;

    }

    

    public static List<Account> getAccountsByName(String accountName) {

        return [SELECT Id, Name 

                FROM Account 

                WHERE Name = :accountName];

    }

}