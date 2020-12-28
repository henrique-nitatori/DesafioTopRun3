/**
* @author Henrique Nitatori - Topi
*/
@isTest
public class RequestAccountAddressTransformerTest {
    @isTest 
    public static void givenToRequestAddressMappingWhenPassAccountObjectThenReturnRequestAddressMapping() {
        Account account = AccountFixeFactory.newDefaultAccount();
        account.Id = '0014x000008223KAAQ';
        RequestAddressMapping requestAddressMapping = new RequestAccountAddressTransformer()
            .toRequestAddressMapping(account);
        System.debug(requestAddressMapping);
    }
}