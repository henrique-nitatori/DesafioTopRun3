/**
* @author Henrique Nitatori - Topi
*/
public class ScheduleAgender {
    public ScheduleAgender() {
        agenderScheduleUpdateAccountAddress();
    }

    public static void agenderScheduleUpdateAccountAddress() {
        ScheduleUpdateAccountAddress scheduleUpdateAccountAddress = new ScheduleUpdateAccountAddress();
        String scheduleTime1 = '0 30 * * * ?';
        system.schedule('Update Account Progress in 30min', scheduleTime1, scheduleUpdateAccountAddress);

        String scheduleTime2 = '0 0 * * * ?';
        system.schedule('Update Account Progress in 0min', scheduleTime2, scheduleUpdateAccountAddress);
    }
}