package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.AppDAO;
import db.AppDAO.Appointment;
import db.UserDAO;
import db.UserDAO.User;

/**
 * Servlet implementation class ShowAppointments
 */
@WebServlet("/ShowAppointments")
public class ShowAppointments extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAppointments() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserDAO.User user = (UserDAO.User) request.getSession().getAttribute("user");
		//session.setAttribute("user", user);
        session.setAttribute("usertype", user.usertype);
        //List<UserDAO.User> users = UserDAO.selectAllusers();
		
        List<UserDAO.User> users = (List<User>) UserDAO.selectAppUsers();
		session.setAttribute("users", users);

        //request.setAttribute("users", users);
        //List<Appointment> appointments = AppDAO.getAllAppointments();
        //session.setAttribute("appointments", appointments);
        request.getRequestDispatcher("showreserv.jsp").forward(request, response);
        //response.sendRedirect("showreserv.jsp");	
	}

}
