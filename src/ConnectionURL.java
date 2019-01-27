public class ConnectionURL {
    private static final String HOSTNAME = "localhost";
    private static final String PORT_NUM = "3306";// MySQL server port number
    public static final String DB_NAME = "nwhack2019";
    private static final String USERNAME = "nwhack2019";
    private static final String PASSWORD = "nwhack2019";
    public static final String URL = "jdbc:mysql://" + HOSTNAME + ":" + PORT_NUM + "/" + DB_NAME + "?user=" + USERNAME
            + "&password=" + PASSWORD + "&autoreconnect=true&serverTimezone=UTC";
}
