/**
* @author Henrique Nitatori - Topi
*/
public class RequestAddressMapping {
    public String name;
    public String externalId;
    public BillingAddress billingAddress;
    public ShippingAddress shippingAddress;

    public class BillingAddress {
        public String street;
        public String city;
        public String zipCode;
        public String state;
        public String country;
    }
    public class ShippingAddress {
        public String street;
        public String city;
        public String zipCode;
        public String state;
        public String country;
    }
}