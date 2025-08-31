public class AccountOperations {

    public static void updateRating(Account acc) {

        // Add null check for safety

        if(acc != null && acc.AnnualRevenue != null) {

            if(acc.AnnualRevenue > 1000000) {

                acc.Rating = 'Hot';

            } else {

                acc.Rating = 'Cold';

            }

        }

    }

}