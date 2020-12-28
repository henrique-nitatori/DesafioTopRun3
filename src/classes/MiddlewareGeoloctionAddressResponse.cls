/**
* @author Henrique Nitatori - Topi
*/
public abstract class MiddlewareGeoloctionAddressResponse {
    private MiddlewareGeoloctionAddressResponse next;

    public MiddlewareGeoloctionAddressResponse linkWith(MiddlewareGeoloctionAddressResponse next) {
        this.next = next;
        return next;
    }


    public abstract Map<Id,Account> check(Integer statusCode, String payload, Map<Id,Account> accounts);


    protected Map<Id,Account> checkNext(Integer statusCode, String payload, Map<Id,Account> accounts) {
        if (next == null) {
            return accounts;
        }
        return next.check(statusCode, payload, accounts);
    }
}