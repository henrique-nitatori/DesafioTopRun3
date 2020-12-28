public class RequestOAuthBuilder {

    public HttpRequest buildRequest ( Map<String,String> oauthRequest) {

        HttpRequest request = new HttpRequest();
        
        request.setBody ( buildPostFormParameters (oauthRequest) );
        request.setHeader ('Content-Type', 'application/x-www-form-urlencoded');
        return request;
    
    }
    
    
    private String buildPostFormParameters ( Map<String,String> oauthRequest ) {
    
        String parameters = '';
    
        for ( String parameterName : oauthRequest.keySet() ) {
    
            if (oauthRequest.get( parameterName ) == null) continue;
    
            parameters += parameterName + '=' + EncodingUtil.urlEncode( oauthRequest.get( parameterName ), 'UTF-8') + '&';
        }
    
        return parameters;
    
    }
}