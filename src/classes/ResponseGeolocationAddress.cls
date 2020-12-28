/**
* @author Henrique Nitatori - Topi
*/
public class ResponseGeolocationAddress extends MiddlewareGeoloctionAddressResponse {

    override
    public Map<Id, Account> check(Integer statusCode, String payload, Map<Id, Account> accounts) {
        if(statusCode == 200) {
            List<ResponseAccountAddress> responseAccountsAddress = 
                (List<ResponseAccountAddress>) JSON.deserialize(payload, List<ResponseAccountAddress>.class);
                
            for(ResponseAccountAddress responseAccountAddress: responseAccountsAddress) {
                Account account = new ResponseAccountAddressTransformer().toResponseAccountAddress(responseAccountAddress);
                accounts.put(account.Id, account);
            }
            return accounts;
        }
        return checkNext(statusCode, payload, accounts);
    }

}