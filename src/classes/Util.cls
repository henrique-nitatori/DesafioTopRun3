/**
* @author Henrique Nitatori - Topi
*/
public class Util {
    public String removeSpecialCharacters(String text){
        return text.replaceAll('[^a-zA-Z0-9]', '');
    }
}