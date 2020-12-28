/**
* @author Henrique Nitatori - Topi
*/
public class GetOutBoundGeolocationAddress {

    public Map<Id, Account> sendAccountAddress(List<Account> accounts) { 
        return postProject(accounts);
    }

    private Map<Id, Account> postProject(List<Account> accounts) {
        HttpRequest request = new HttpRequest();
        
        String accessToken = (String) Cache.Org.get(AccessTokenCacheBuilder.class, 'acessToken');

        request.setEndpoint('https://bisso-topirun-20-dev-ed.my.salesforce.com/services/apexrest/api/account/geolocation');
        request.setMethod('PATCH');
        request.setHeader('Authorization', 'Bearer ' + accessToken);
        request.setHeader('Content-Type', 'application/json');
        String requestBody = JSON.serialize(new RequestGeolocationAddressTransformer().toRequestGeolocationAddress(accounts));
        System.debug('Body: ' + requestBody);
        request.setBody(requestBody);

        Http htpp = new Http();
        
        HttpResponse response = htpp.send(request);

        String payload = response.getBody();

        return new MiddlewareGeolocationAddressRun().run(response.getStatusCode(), payload, new Map<Id, Account>());
    }
}