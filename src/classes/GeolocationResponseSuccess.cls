/**
* @author Henrique Nitatori - Topi
*/
public class GeolocationResponseSuccess extends MiddlewareGeoloctionResponse {

    override
    public Account check(Integer statusCode, String payload, Account account) {
        if(statusCode == 200) {
            account.GeolocationRequested__c = true;
            return account;
        }
        return checkNext(statusCode, payload, account);
    }

}