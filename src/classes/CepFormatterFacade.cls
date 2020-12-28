/**
* @author Henrique Nitatori - Topi
*/
public class CepFormatterFacade {
    CepFormatter CepFormatter;


    public CepFormatterFacade() {
        this.CepFormatter = new CepFormatter();
    }

    public List<Account> formatterCep(List<Account> accounts) {

        for(Account account : accounts) {
            if(String.isEmpty(account.BillingPostalCode) || String.isEmpty(account.ShippingPostalCode)) continue;
            account.BillingPostalCode = this.cepFormatter.format(account.BillingPostalCode);
            account.ShippingPostalCode = this.cepFormatter.format(account.ShippingPostalCode);
        }

        return accounts;
    }
}