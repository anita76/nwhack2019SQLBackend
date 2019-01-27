import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.LinkedList;
import java.util.List;

public class User {
    public String firstName;
    public String lastName;
    public String email;
    public String userName;
    public String city;
    public String country;
    public String password;
    public JDBCDriver jdbcDriver;
    public List<Experience> myExperiences = new LinkedList<Experience>();
    public List<Experience> myFavorites = new LinkedList<Experience>();
    public List<Experience> mysearchResult = new LinkedList<Experience>();

    public User(String userID) {
        jdbcDriver = new JDBCDriver();
    }

    public String login(String userName, String password) {
        this.userName = userName;
        this.password = password;
        String query = "select * from users where userName=" + userName;
        ResultSet result = jdbcDriver.executeDataQuery(query);
        boolean next = tryNext(result);

        if (next) {
            try {
                String ps = result.getString("password");
                if (!this.password.equals(ps)) {
                    return "incorrect username or password";
                } else {
                    firstName = result.getString("firstName");
                    lastName = result.getString("lastName");
                    email = result.getString("email");
                    city = result.getString("city");
                    country = result.getString("country");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.exit(-1);
            }
        } else {
            return "incorrect username or password";
        }
        return "logged in";
    }


    public String createAccount(String firstName, String lastName, String email, String userName, String country, String city, String password) {

        String query = "select * from users where userName=" + userName;
        ResultSet result = jdbcDriver.executeDataQuery(query);
        boolean next = tryNext(result);

        if (next) {
            return "username not available";
        }
        String sqlStatement = "insert into users values ("+ userName+", " + lastName + ", " + firstName+
                ", " + email + ", " + country + ", " + city + ", " + password;
        String outcome = jdbcDriver.executeDataUpdate(sqlStatement);
        if(outcome.equals("success")){
            return "registered";
        }else{
            return "failed to register";
        }

    }

    public List<Experience> getMyExperiences(){
        String query = "select * from experiences where userName =" + this.userName;
        ResultSet result = jdbcDriver.executeDataQuery(query);
        addExperienceToList(result,myExperiences);
        return myExperiences;
    }


    public List<Experience> getMyFavorites(){
        String query = "select e.cityName, e.countryName, e.userName, e.briefDescp, e.transport, e.healthcare"+
                ", e.cost, e.banking, e.culture, e.weather, e.safety, e.leisure, e.numLikes, e.datePosted"+
                " from experiences e, favorites f where e.userName = f.userName and f.userName=" + userName;
        ResultSet rs = jdbcDriver.executeDataQuery(query);
        addExperienceToList(rs, myFavorites);
        return myFavorites;
    }

    public List<Experience> getMysearchResult(String cityName, String countryName){
        String query = "select * from experiences where cityName=" + cityName + " and countryName=" + countryName;
        ResultSet rs = jdbcDriver.executeDataQuery(query);
        addExperienceToList(rs, mysearchResult);
        return mysearchResult;
    }

    public void addToFavorites(Experience exp){
        myFavorites.add(exp);
        Experience.createFavoriteTable(jdbcDriver,exp,userName);
    }

    public void addToMyExperiences(ExperienceParameters expParam){
        Experience exp = Experience.createExpTable(jdbcDriver,expParam);
        myExperiences.add(exp);
    }


    private void addExperienceToList(ResultSet result, List<Experience> lst){
        while(tryNext(result)){
            ExperienceParameters params = new ExperienceParameters();
            LocalDate ld;
            try{
                params.leisure = result.getString("leisure");
                params.numLikes = result.getInt("numLikes");
                params.safety = result.getString("safety");
                params.weather = result.getString("weather");
                params.culture = result.getString("culture");
                params.banking = result.getString("banking");
                params.cost = result.getString("cost");
                params.healthcare = result.getString("healthcare");
                params.transport = result.getString("transport");
                params.briefDescp = result.getString("briefDescp");
                params.cityName = result.getString("cityName");
                params.countryName = result.getString("countryName");
                ld = result.getDate("postDate").toLocalDate();
                lst.add(new Experience(params,ld));
            }catch(SQLException e){
                System.out.println("\nMessage: " + e.getMessage());
            }
        }
    }



    private boolean tryNext(ResultSet result) {
        boolean next = false;
        try {
            next = result.next();
        } catch (SQLException e) {
            e.printStackTrace();
            System.exit(-1);
        }
        return next;
    }
}
