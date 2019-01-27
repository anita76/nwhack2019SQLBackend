import java.time.LocalDate;
import java.util.List;

public class Experience {
    public ExperienceParameters expParams;
    public LocalDate postDate;
    JDBCDriver jdbcDriver;


    Experience(ExperienceParameters params, LocalDate date){
        expParams = params;
        postDate = date;
    }


    public static Experience createExpTable(JDBCDriver jdbcDriver, ExperienceParameters params){
        LocalDate ld = LocalDate.now();
        Experience exp = new Experience(params, ld);
        String query = "insert into experiences values (" +params.cityName +  ", " + params.countryName
                + ", " + exp.expParams.userName + ", " + params.briefDescp + ", " + params.transport + ", " +
                params.healthcare + ", " + params.cost + ", " + params.banking + ", " + params.culture + ", " +
                params.weather + ", " + params.safety + ", " + params.leisure + ", " + params.numLikes + ", ? )";
        exp.postDate = LocalDate.now();
        jdbcDriver.executeUpdateWithDate(exp.postDate, query);
        return exp;
    }

    public static void createFavoriteTable(JDBCDriver jdbcDriver, Experience exp, String userName){
        String sql = "insert into favorites values (" + exp.expParams.cityName + ", " + exp.expParams.countryName +
                ", " + exp.expParams.userName + ", " + userName + ")";
        jdbcDriver.executeDataUpdate(sql);
    }


}


