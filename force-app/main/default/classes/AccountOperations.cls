public class AccountOperations {

    public static void updateRating(Account acc) {

        // Add null check for safety

        if(acc != null && acc.NumberOfEmployees != null) {

            if(acc.NumberOfEmployees < 10) {

                acc.Rating = 'Cold';

            }

        }

    }

}