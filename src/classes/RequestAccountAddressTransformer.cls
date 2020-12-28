/**
* @author Henrique Nitatori - Topi
*/
public class RequestAccountAddressTransformer {

    public RequestAddressMapping toRequestAddressMapping (Account account) {
        RequestAddressMapping requestAddressMapping = new RequestAddressMapping();
        RequestAddressMapping.BillingAddress billingAddress = new RequestAddressMapping.BillingAddress();
        RequestAddressMapping.ShippingAddress shippingAddress = new RequestAddressMapping.ShippingAddress();

        requestAddressMapping.name = account.Name;
        requestAddressMapping.externalId = account.Id;
        
        billingAddress.street = account.BillingStreet;
        billingAddress.city = account.BillingCity;
        billingAddress.zipCode = account.BillingPostalCode;
        billingAddress.state	 = account.BillingState;
        billingAddress.country = account.BillingCountry;

        shippingAddress.street = account.ShippingStreet;
        shippingAddress.city	 = account.ShippingCity;
        shippingAddress.zipCode =	account.ShippingPostalCode;
        shippingAddress.state	 = account.ShippingState;
        shippingAddress.country =	account.ShippingCountry;

        requestAddressMapping.billingAddress = billingAddress;
        requestAddressMapping.shippingAddress = shippingAddress;

        return requestAddressMapping;
    }
    
}