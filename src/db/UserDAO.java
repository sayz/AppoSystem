package db;

/*
 * User database manager
 */

/**
 *
 * @author sayz
 */


import utils.Utils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class UserDAO {
    public static final int ADMIN = 0;
    public static final int USER = 2;
    
    private static final String UPDATEUSER = "UPDATE  Users SET  appodate =  ?, appotime =  ? WHERE  Users.username = ?";
    private static final String CHECKUSER = "Select * from Users where username=? and password=?";
    private static final String CREATEUSER = "Insert into Users (username, password, fullname, appodate, appotime, appoid, usertype) values (?, ?, ?, ?, ?, ?, ?)";
    private static final String FINDUSER = "Select * from Users where (username like ? or fullname like ?) and usertype=2";
    private static final String GETALLUSERS = "Select * from Users";
    private static final String DELETEUSER = "Delete from Users where id=? and not usertype=0";
    private static final String GETAPPUSERS = "SELECT U.id, username, fullname, date, hour, isdone, usertype, appoid FROM Appointments A, Users U WHERE A.userid = U.id";
    
    public static User existsUser(String username, String password){
        if(Utils.isNullOrEmpty(username) || Utils.isNullOrEmpty(password)){
            return null;
        }
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(CHECKUSER);
            s.setString(1, username);
            s.setString(2, password);
            ResultSet result = s.executeQuery();
            if(result.first()){
                int id = result.getInt("id");
                String fullname = result.getString("fullname");
                String appodate = result.getString("appodate");
                String appotime = result.getString("appotime");
                int appoid = result.getInt("appoid");
                int usertype = result.getInt("usertype");
                
                User user = new User(id, username, password, fullname, appodate, appotime, appoid, usertype);
                return user;
            }
        } catch(Exception e){ }
        return null;
    }
    
    /**
     * Returns true if a user was successfully created.
     */
    public static User createUser(String username, String password, String fullname, String appodate, String appotime, int appoid, int usertype){
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(CREATEUSER, Statement.RETURN_GENERATED_KEYS);
            s.setString(1, username);
            s.setString(2, password);
            s.setString(3, fullname);
            s.setString(4, appodate);
            s.setString(5, appotime);
            s.setInt(6, appoid);
            s.setInt(7, usertype);

            @SuppressWarnings("unused")
			int result = s.executeUpdate();
            ResultSet res = s.getGeneratedKeys();
            if(res.next()){
                return new User(res.getInt(1), username, password, fullname, appodate, appotime, appoid, usertype);
            }            
        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @SuppressWarnings("unused")
	public static void upUser(String username, String appodate, String appotime ){        
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(UPDATEUSER);
            s.setString(1, appodate);
            s.setString(2, appotime);
            s.setString(3, username);

            int result = s.executeUpdate();
            ResultSet res = s.getGeneratedKeys();            
        } catch(Exception e){
            e.printStackTrace();
        }
    }
    
    public static List<User> FindUsers(String query){
        if(Utils.isNullOrEmpty(query))
            return  null;
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(FINDUSER);
            s.setString(1, "%" + query + "%");
            s.setString(2, "%" + query + "%");
            ResultSet res = s.executeQuery();
            List<User> users = new ArrayList<User>(); 
            while(res.next()){
                users.add(extractUser(res));
            }        
            return users;
        } catch(Exception e){ }
        return null;
    }
    public static List<User> selectAllusers(){
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(GETALLUSERS);
            ResultSet res = s.executeQuery();
            List<User> users = new ArrayList<User>(); 
            while(res.next()){
                users.add(extractUser(res));
            }        
            return users;
        } catch(Exception e){ }
        return null;
    }
    public static List<User> selectAppUsers(){
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(GETAPPUSERS);
            ResultSet res = s.executeQuery();
            List<User> users = new ArrayList<User>(); 
            while(res.next()){
                users.add(extractAppUser(res));
            }        
            return users;
        } catch(Exception e){ }
        return null;
    }
    public static boolean removeUser(int userid){
        try {
            Connection con = DB.getConnection();
            PreparedStatement s = con.prepareStatement(DELETEUSER);
            s.setInt(1, userid);
            int res = s.executeUpdate();
            if(res == 1)
                return true;
        } catch(Exception e){ }
        return false;
    }
    
    public static User extractUser(ResultSet result) throws Exception{
        int id = result.getInt("id");
        String username = result.getString("username");
        String password = result.getString("password");
        String fullname = result.getString("fullname");
        String appodate = result.getString("appodate");
        String appotime = result.getString("appotime");
        int appoid = result.getInt("appoid");
        int usertype = result.getInt("usertype");
        return new User(id, username, password, fullname, appodate, appotime, appoid, usertype);
    }

    public static User extractAppUser(ResultSet result) throws Exception{
        int id = result.getInt("id");
        int isdone = result.getInt("isdone");
        String username = result.getString("username");
        //String password = result.getString("password");
        String fullname = result.getString("fullname");
        String date = result.getString("date");
        String hour = result.getString("hour");
        //String appodate = result.getString("appodate");
        //String appotime = result.getString("appotime");
        int appoid = result.getInt("appoid");
        int usertype = result.getInt("usertype");
        return new User(id, appoid, username, date, fullname, hour, isdone, usertype);
    }
    
    public static class User{
        public int id;
        public String username;
        public String password;
        public String fullname;
        public String appodate;
        public String appotime;
        public String date;
        public String hour;
        public int isdone;
        public int appoid;
        public int usertype;
        
        public User(int id, String username, String password, String fullname, String appodate, 
        		String appotime, int appoid, int usertype){
            this.id = id;
            this.username = username;
            this.password  = password;
            this.fullname = fullname;
            this.usertype = usertype;
            this.appodate = appodate;
            this.appotime = appotime;
            this.appoid = appoid;
        }
        
        public User(int id2, int appoid, String username2, String date, String fullname2,
				String hour, int isdone, int usertype2) { 
            this.id = id2;
            this.username = username2;
            this.fullname = fullname2;
            this.date = date;
            this.hour = hour;
            this.isdone = isdone;
            this.usertype = usertype2;
            this.appoid = appoid;
		}

		public boolean isValid(){
            return this.id != 0 && !Utils.isNullOrEmpty(username) && !Utils.isNullOrEmpty(password);
        }
        
        public boolean isAdmin(){
            return this.usertype == UserDAO.ADMIN;
        }

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getFullname() {
			return fullname;
		}

		public void setFullname(String fullname) {
			this.fullname = fullname;
		}

		public String getAppodate() {
			return appodate;
		}

		public void setAppodate(String appodate) {
			this.appodate = appodate;
		}

		public String getAppotime() {
			return appotime;
		}

		public void setAppotime(String appotime) {
			this.appotime = appotime;
		}

		public int getAppoid() {
			return appoid;
		}

		public void setAppoid(int appoid) {
			this.appoid = appoid;
		}

		public int getUsertype() {
			return usertype;
		}

		public void setUsertype(int usertype) {
			this.usertype = usertype;
		}

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

        
        
    }
}
