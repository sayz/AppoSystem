package db;

/*
 * Reservations Database Manager
 */

/**
 *
 * @author brook
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppDAO {    
    private static final String CREATEAPPOINTMENT = "Insert into Appointments(userid, date, hour, isdone)"
            + " values(?, ?, ?, ?)";

    private static final String UPDATEAPPOINTMENT = "Update Appointments set date=?, hour=? where userid=?";

    
    private static final String REMOVEAPPOINTMENT = "Delete from Appointments where userid=?";
    private static final String GETALL = "Select * from Appointments A, Users U where A.userid = U.id";
    //private static final String GETALL = "SELECT id, username, userid, date, hour FROM Appointments A, Users U WHERE A.userid = U.id";
    //private static final String GETALL = "Select * from Appointments";
    //private static final String GETALLEVENTRESERVATIONS = "Select * from Appointments A, Users U where A.userid = U.id and R.eventid=?";
    private static final String GETUSERAPPOINTMENT = "Select * from Appointments where userid=?";
    //private static final String GETALLUSERRESERVATION = "Select * from Reservations, Events E "
      //      + "where userid=? and R.eventid=E.id";

    public static Appointment createAppointment(int userid, String date, String hour, int isdone) {
        try {
            if(getUserAppointments(userid) != null){//just update the field
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement(UPDATEAPPOINTMENT, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, userid);
                ps.setString(2, date);
                ps.setString(3, hour);
                ps.setInt(4, isdone);
                int result = ps.executeUpdate();
                if(result > 0){
                    return new Appointment(1, userid, date, hour, isdone); //id can be bogus, not used
                }
            } else {
                Connection con = DB.getConnection();
                PreparedStatement ps = con.prepareStatement(CREATEAPPOINTMENT, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, userid);
                ps.setString(2, date);
                ps.setString(3, hour);
                ps.setInt(4, isdone);
                int result = ps.executeUpdate();
                ResultSet res = ps.getGeneratedKeys();
                if (res.next()) {
                    return new Appointment(res.getInt(1), userid, date, hour, isdone);
                }
            }

        } catch (Exception ex) {
        }
        return null;
    }

    public static boolean removeappointment(int userid) {
        try {
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement(REMOVEAPPOINTMENT);
            ps.setInt(1, userid);
            int result = ps.executeUpdate();
            if (result > 0) {
                return true;
            }

        } catch (Exception ex) {
        }
        return false;
    }

    public static List<Appointment> getAllAppointments() {
        try {
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement(GETALL);
            ResultSet result = ps.executeQuery();
            List<Appointment> appointments = new ArrayList<Appointment>();
            while (result.next()) {
            	Appointment res = extractAppointment(result);
                res.user = extractUser(result);
                appointments.add(extractAppointment(result));
            }
            return appointments;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    
    public static List<Appointment> getAllUserAppointments(int userid) {
        try {
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement(GETUSERAPPOINTMENT);
            ps.setInt(1, userid);
            ResultSet result = ps.executeQuery();
            List<Appointment> appointment = new ArrayList<Appointment>();
            while (result.next()) {
            	Appointment res = extractAppointment(result);
                res.user = extractUser(result);
                appointment.add(res);
            }
            return appointment;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static Appointment getUserAppointments(int userid) {
        try {
            Connection con = DB.getConnection();
            PreparedStatement ps = con.prepareStatement(GETUSERAPPOINTMENT);
            ps.setInt(1, userid);
            ResultSet result = ps.executeQuery();
            if (result.first()) {
                Appointment res = extractAppointment(result);
                return res;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public static Appointment extractAppointment(ResultSet result) throws Exception{
        int id = result.getInt("id");
        int userid = result.getInt("userid");        
        String date = result.getString("date");
        String hour = result.getString("hour");
        int isdone = result.getInt("isdone");
        //String username = result.getString("username");
        //String fullname = result.getString("fullname");
        Appointment res = new Appointment(id, userid, date, hour, isdone);
        //Appointment res = new Appointment(id, userid, date, hour, isdone, UserDAO.extractUser(result));
        return res;
    }

    //different from UserDAO because we joined, so different column name of id
    private static UserDAO.User extractUser(ResultSet set) throws Exception{
        int userid = set.getInt("userid");
        String fullname = set.getString("fullname");
        String username = set.getString("username");
        String password = set.getString("password");
        String appodate = set.getString("appodate");
        String appotime = set.getString("appotime");
        int appoid = set.getInt("appoid");
        int usertype = set.getInt("usertype");
        return  new UserDAO.User(userid, username, password, fullname, appodate, appotime, appoid, usertype);
    }
    
    public static class Appointment {      

        public int id;
        public int userid;
        public String date;
        public String hour;
        public int isdone;
        public String username;
        public UserDAO.User user;
        
        public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		public String getHour() {
			return hour;
		}
		public void setHour(String hour) {
			this.hour = hour;
		}
		public int getIsdone() {
			return isdone;
		}
		public void setIsdone(int isdone) {
			this.isdone = isdone;
		}
        
        public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}

		public UserDAO.User getUser() {
			return user;
		}
		public void setUser(UserDAO.User user) {
			this.user = user;
		}
		
        public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		
		public Appointment(int id, int userid, String date, String hour, int isdone, UserDAO.User user){
            this(id, userid, date, hour, isdone);
            this.user = user;
        }
		public Appointment(int id, int userid, String date, String hour, int isdone ) {
            this.id = id;
            this.userid = userid;
            this.date = date;
            this.hour = hour;
            this.isdone = isdone;

        }        
    }
}
