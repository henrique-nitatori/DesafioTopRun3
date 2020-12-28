/**
* @author Henrique Nitatori - Topi
*/
public class RequestGeolocationAddressTransformer {
    
    public RequestGeolocationAddressMapping toRequestGeolocationAddress(List<Account> accounts) {
        List<Id> ids = new List<Id>();
        RequestGeolocationAddressMapping requestGeolocationAddressMapping = new RequestGeolocationAddressMapping();

        for(Account account : accounts) {
            ids.add(account.Id);
        }

        requestGeolocationAddressMapping.externalIds = ids;

        return requestGeolocationAddressMapping;
    }
}