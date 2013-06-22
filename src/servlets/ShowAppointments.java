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
		HttpSession session = request.getSession();
		UserDAO.User user = (UserDAO.User) request.getSession().getAttribute("user");
        List<UserDAO.User> usersAppos = (List<User>) UserDAO.selectAppUsers();
        AppDAO.Appointment userAppo = AppDAO.getUserAppointments(user.id);
        
		session.setAttribute("ufname", user.fullname);
        session.setAttribute("usertype", user.usertype);
		session.setAttribute("users", usersAppos);
		session.setAttribute("uappo", userAppo);

        request.getRequestDispatcher("showreserv.jsp").forward(request, response);
        //response.sendRedirect("showreserv.jsp");	
	}

}
