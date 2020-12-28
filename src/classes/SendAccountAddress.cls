/**
* @author Henrique Nitatori - Topi
*/
public class SendAccountAddress implements Queueable, Database.AllowsCallouts  {
    
    private List<Account> accounts;

    public SendAccountAddress(List<Account> accounts) {
        this.accounts = accounts;
    }

    public void execute(QueueableContext context) {
        List<Account> oldAccounts = new AccountRepository().findById(accounts);
        List<Account> accountsUpdatedGeolocationStatus = new List<Account>();
        for (Account account : oldAccounts) {
            accountsUpdatedGeolocationStatus.add(
                new PutOutBoundAddressMappingService().sendAccountAddress(account)
                );
        }
        update accountsUpdatedGeolocationStatus;
    }
}