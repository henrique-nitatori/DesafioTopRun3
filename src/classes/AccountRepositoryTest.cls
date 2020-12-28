/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class AccountRepositoryTest {
    @isTest
    public static void givenFindByIdWhenfindAccountByIdThenReturnAccount() {
        List<Account> findAccounts = new List<Account>{AccountFixeFactory.createAccount()};
        List<Account> accounts = new AccountRepository().findById(findAccounts);

        System.assertEquals(findAccounts[0].Id, accounts[0].Id);
    }
}