/**
* @author Henrique Nitatori - Topi
*/
public class AccessTokenCacheBuilder implements Cache.CacheBuilder {
    RequestOAuthBuilder requestOAuthBuilder;

    public AccessTokenCacheBuilder() {
        this.requestOAuthBuilder = new RequestOAuthBuilder();
    }

    public Object doLoad(String keyCache) {
        Map<String,String> oauthRequest = new Map<String,String>();

        oauthRequest.put('client_id', '3MVG9l2zHsylwlpS6h2vTmlmUGQBhdenOwDRCOFn28Edf9ajwCJ3THJs1OvxrZPVNucENmEJb.7paFUCK3Kqr');
        oauthRequest.put('client_secret', 'BFC7A19775AA64B697A6F712F62E2D0A671321BBA2FAE18973580F4557F5FC68');
        oauthRequest.put('redirect_uri', 'http://localhost');
        oauthRequest.put('grant_type', 'password');
        oauthRequest.put('username', 'integration.user@topirun.com');
        oauthRequest.put('password', '@TopiRun2020');

        HttpRequest request = this.requestOAuthBuilder.buildRequest(oauthRequest);
        request.setMethod('POST');
        request.setEndpoint('https://login.salesforce.com/services/oauth2/token');

        Http http = new Http(); 

        HttpResponse response = http.send(request);

        if(response.getStatusCode() > 400) return new CalloutException('Error');

        String payload = response.getBody();

        AccessTokenResponse accessTokenResponse = (AccessTokenResponse) JSON.deserialize(payload, AccessTokenResponse.class);
        System.debug(accessTokenResponse);
        return accessTokenResponse.access_token;
    }

}