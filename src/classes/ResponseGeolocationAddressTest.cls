/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class ResponseGeolocationAddressTest {
    @isTest
    public static void givenCheckResponseGeolocationAddressWhenResponseStatusde200ThenReturnListAccount() {

        String payload = '[ { "shippingAddress": { "zipCode": "14350-970", "street": "Rua Coronel Honório Palma 135", "state": "SP", "longitude": -47.37663, "latitude": -21.02352, "country": "Brasil", "city": "Altinópolis" }, "name": "Teste do Bisso", "externalId": "0014x000008223NAAQ", "billingAddress": { "zipCode": "18770-970", "street": "Rua Pedro Dias Batista 70", "state": "SP", "longitude": -49.24069129319908, "latitude": -22.880184142428277, "country": "Brasil", "city": "Águas de Santa Bárbara" } } ]';

        Map<Id,Account> accounts  =  new ResponseGeolocationAddress().check(200, payload, new Map<Id,Account>());

        System.assertEquals('0014x000008223NAAQ', accounts.get('0014x000008223NAAQ').Id);
        System.assertEquals(-49.24069129319908, accounts.get('0014x000008223NAAQ').BillingLongitude);
        System.assertEquals(-22.880184142428277, accounts.get('0014x000008223NAAQ').BillingLatitude);
        System.assertEquals(-47.37663, accounts.get('0014x000008223NAAQ').ShippingLongitude);
        System.assertEquals(-21.02352, accounts.get('0014x000008223NAAQ').ShippingLatitude);

    }
}