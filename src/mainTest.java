import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class mainTest {
    // Run this as Java application to reset db schema.
    public static void main(String[] args) {
        try {
            // Step 1 Connect to MySQL.
            System.out.println("Connecting to " + ConnectionURL.URL);
            Class.forName("com.mysql.cj.jdbc.Driver").getConstructor().newInstance();
            Connection conn = DriverManager.getConnection(ConnectionURL.URL);

            if (conn == null) {
                return;
            }

            // Step 2 Drop tables in case they exist.
            // drop tables with foreign key first
            Statement stmt = conn.createStatement();
            String sql = "drop table if exists favorites";
            stmt.executeUpdate(sql);

            sql = "drop table if exists experiences";
            stmt.executeUpdate(sql);

            sql = "drop table if exists users";
            stmt.executeUpdate(sql);

            sql = "drop table if exists cities";
            stmt.executeUpdate(sql);

            sql = "drop table if exists countries";
            stmt.executeUpdate(sql);

            // Step 3 Create new tables


            System.out.println("Import done successfully");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
