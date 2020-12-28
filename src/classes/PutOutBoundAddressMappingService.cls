/**
* @author Henrique Nitatori - Topi
*/
public class PutOutBoundAddressMappingService {

    RequestAccountAddressTransformer requestAccountAddressTransformer;

    public PutOutBoundAddressMappingService() {
        this.requestAccountAddressTransformer = new RequestAccountAddressTransformer();
    }

    public Account sendAccountAddress(Account account) {
        return postProject(account);
    }

    private Account postProject(Account account) {
        HttpRequest request = new HttpRequest();
        
        String accessToken = (String) Cache.Org.get(AccessTokenCacheBuilder.class, 'acessToken');

        request.setEndpoint('https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation');
        request.setMethod('PUT');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setBody(JSON.serialize(this.requestAccountAddressTransformer.toRequestAddressMapping(account)));

        Http htpp = new Http();
        
        HttpResponse response = htpp.send(request);

        String payload = response.getBody();

        return new MiddlewareGeolocationRun().run(response.getStatusCode(), payload, account);
    }
}