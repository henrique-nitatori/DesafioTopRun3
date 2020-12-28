/**
* @author Henrique Nitatori - Topi
*/
public abstract class MiddlewareGeoloctionResponse {
    private MiddlewareGeoloctionResponse next;

    public MiddlewareGeoloctionResponse linkWith(MiddlewareGeoloctionResponse next) {
        this.next = next;
        return next;
    }


    public abstract Account check(Integer statusCode, String payload, Account account);


    protected Account checkNext(Integer statusCode, String payload, Account account) {
        if (next == null) {
            return account;
        }
        return next.check(statusCode, payload, account);
    }
}