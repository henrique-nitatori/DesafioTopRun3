/**
* @author Henrique Nitatori - Topi
*/
public class MiddlewareGeolocationAddressRun {

    public Map<Id, Account> run(Integer statusCode, String response, Map<Id, Account> account) {
        ResponseGeolocationAddress middleware = new ResponseGeolocationAddress();
        return middleware.check(statusCode, response, account);
    }

}