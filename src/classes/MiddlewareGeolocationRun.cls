/**
* @author Henrique Nitatori - Topi
*/
public class MiddlewareGeolocationRun {

    public Account run(Integer statusCode, String response, Account project) {
        MiddlewareGeoloctionResponse middleware = new GeolocationResponseFail();
        middleware.linkWith(new GeolocationResponseSuccess());
        return middleware.check(statusCode, response, project);
    }

}