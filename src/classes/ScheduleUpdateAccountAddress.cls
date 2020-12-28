/**
* @author Henrique Nitatori - Topi
*/
global class ScheduleUpdateAccountAddress implements Schedulable {
    global void execute(SchedulableContext ctx) {
        UpdateaccountAddress updateaccountAddress = new UpdateaccountAddress();
        Database.executeBatch(updateaccountAddress, 200);
    }
}