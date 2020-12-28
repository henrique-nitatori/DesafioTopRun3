public class ResponseAccountAddressTransformer {

    public Account toResponseAccountAddress (ResponseAccountAddress responseAccountAddress) {
        Account account = new Account();

        account.Id = responseAccountAddress.externalId;

        account.BillingLatitude = responseAccountAddress.billingAddress.latitude;
        account.BillingLongitude = responseAccountAddress.billingAddress.longitude;

        account.ShippingLatitude = responseAccountAddress.shippingAddress.latitude;
        account.ShippingLongitude = responseAccountAddress.shippingAddress.longitude;

        return account;
    }
}