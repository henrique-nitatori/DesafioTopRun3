/**
* @author Henrique Nitatori - Topi
*/
public class BissoApiSuccessHttpMock implements HttpCalloutMock {
    String payload;

    public BissoApiSuccessHttpMock (String payload) {
        this.payload = payload;
    }
    public HttpResponse respond (HttpRequest request) {
        HttpResponse response = new HttpResponse();

        response.setBody (payload);
        response.setStatusCode (200);

        return response;
    }

}