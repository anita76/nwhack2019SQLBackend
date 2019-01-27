import org.springframework.cglib.core.Local;

import java.sql.*;
import java.time.LocalDate;

public class JDBCDriver {

    private Connection conn;
    private static java.sql.Statement stmt;

    public JDBCDriver() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver").getConstructor().newInstance();
            conn = DriverManager.getConnection(ConnectionURL.URL);
            stmt = conn.createStatement();
            conn.setAutoCommit(false);

        } catch (Exception e) {
            System.out.println("\nMessage: " + e.getMessage());
        }
    }


    public void close() {
        if (conn != null) {
            try {
                conn.close();
            } catch (Exception e) {
                System.out.println("\nMessage: " + e.getMessage());
            }
        }
    }



    public String executeDataUpdate(String sqlStatement){
        String outcome="success";
        try{
            stmt.executeUpdate(sqlStatement);
            conn.commit();
        } catch (SQLException ex) {
            System.out.println("\nMessage: " + ex.getMessage());
            System.out.println("\nFailed to update!");
            outcome=ex.getMessage();
        }

        return outcome;
    }

    // This is to execute any query statements
    public ResultSet executeDataQuery(String sqlStatement){
        try {
            return  stmt.executeQuery(sqlStatement);
        } catch (SQLException ex) {
            System.out.println("\nMessage: " + ex.getMessage());
            System.out.println("\nFailed to execute query: " + sqlStatement);
            return null;
        }
    }

    public String executeUpdateWithDate(LocalDate localDate, String sqlStatement){
        String outcome = "success";
        try {
            PreparedStatement prs = conn.prepareStatement(sqlStatement);
            prs.setDate(1, Date.valueOf(localDate));
            prs.executeUpdate();
            conn.commit();
        }catch (Exception ex){
            System.out.println("\nMessage: " + ex.getMessage());
            System.out.println("\nFailed to update!");
            outcome = ex.getMessage();
        }
        return outcome;
    }
}
