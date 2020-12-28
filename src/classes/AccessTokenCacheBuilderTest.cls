/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class AccessTokenCacheBuilderTest {
    @isTest
    public static void givenDoLoadWhenSaveAccessTokenInCacheThenReturnToken() {
        String payload = '{ "access_token": "00D4W0000048AiQ!AQoAQKgVN6E4i3uIec7RcHjSHfFcknDSEU6D2QKFybFmMrW566TwI1YxcA0aEEeVVsvfAUaUHv5r1PAZzPaFfPQ.XuImOXGt", "instance_url": "https://bisso-topirun-20-dev-ed.my.salesforce.com", "id": "https://login.salesforce.com/id/00D4W0000048AiQUAU/0054W00000B99edQAB", "token_type": "Bearer", "issued_at": "1601639269587", "signature": "Y4PFBhk+5IhmznVJobqlK6rK8ggSOD41seY4auvYJzA=" }';

        Test.startTest();
        Test.setMock( HttpCalloutMock.class, new BissoApiSuccessHttpMock(payload));
        String accessToken = (String) Cache.Org.get(AccessTokenCacheBuilder.class, 'acessToken');
        Test.stopTest();
        System.debug('Token ' + accessToken);
        String token = '00D4W0000048AiQ!AQoAQKgVN6E4i3uIec7RcHjSHfFcknDSEU6D2QKFybFmMrW566TwI1YxcA0aEEeVVsvfAUaUHv5r1PAZzPaFfPQ.XuImOXGt';
        System.assertEquals(token, accessToken);
    }

}