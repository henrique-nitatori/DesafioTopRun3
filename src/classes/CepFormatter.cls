/**
* @author Henrique Nitatori - Topi
*/
public class CepFormatter {
    Util util;

    public CepFormatter() {
        this.util = new Util();
    }
    public String format(String cep) {
        cep = this.util.removeSpecialCharacters(cep);
        return cep.substring(0, 5) + '-' + cep.substring(5);
    }
}