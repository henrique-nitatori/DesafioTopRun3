/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class GeolocationResponseSuccessTest {
    @isTest
    public static void givenGeolocationResponseSuccessWhenSendRequestThenReturnAccountObject() {

        String payload = '';
        Account accountCreated = AccountFixeFactory.newAccount();

        Account account  =  new GeolocationResponseSuccess().check(200, payload, accountCreated);

        System.assertEquals(true, account.GeolocationRequested__c);
    }
    
}