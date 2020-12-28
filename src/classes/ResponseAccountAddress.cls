/**
* @author Henrique Nitatori - Topi
*/
public class ResponseAccountAddress {

    public String externalId;
    public BillingAddress billingAddress;
    public ShippingAddress shippingAddress;

    public class BillingAddress {
        public Decimal latitude;
        public Decimal longitude;
    }

    public class ShippingAddress {
        public Decimal latitude;
        public Decimal longitude;
    }
}