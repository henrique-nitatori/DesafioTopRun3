/**
* @author Henrique Nitatori - Topi
*/
public class GeolocationResponseFail extends MiddlewareGeoloctionResponse {

    override
    public Account check(Integer statusCode, String payload, Account account) {
        if(statusCode >= 400) {
            List<GeolocationResponseFailPayload> geolocationResponseFailPayload =
                (List<GeolocationResponseFailPayload>) JSON.deserialize(payload, List<GeolocationResponseFailPayload>.class);

            Account.GeolocationErrorMessage__c = geolocationResponseFailPayload[0].message;

            return account;
        }
        return checkNext(statusCode, payload, account);
    }

}