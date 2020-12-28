/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class GeolocationResponseFailTest {
    @isTest
    public static void givenCheckResponseWhenResponseStatusde400ThenReturnMessageErrorInFieldOfObject() {

        String payload = '[ {"errorCode": "APEX_ERROR", "message": "Error Message"} ]';
        Account accountCreated = AccountFixeFactory.newAccount();

        Account account  =  new GeolocationResponseFail().check(400, payload, accountCreated);

        System.assertEquals('Error Message', account.GeolocationErrorMessage__c);
    }
}