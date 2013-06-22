package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.AppDAO;
import db.UserDAO;

/**
 * Servlet implementation class AppoServlet
 */
@WebServlet("/AppoServlet")
public class AppoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//getAllAppointments(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDAO.User user = (UserDAO.User) request.getSession().getAttribute("user");
        session.setAttribute("user", user);
        session.setAttribute("usertype", user.usertype);
		//String action = null;
		//List<AppDAO.Appointment> appointments = null;
		//if (Utils.isNullOrEmpty(action)) {
			//return;
		//}
		//PrintWriter out = response.getWriter();
		int uid = Integer.parseInt(request.getParameter("uid"));
		String adate = request.getParameter("datetime").substring(0, 10);
		String atime = request.getParameter("datetime").substring(11);
		AppDAO.Appointment appointment = AppDAO.createAppointment(uid, adate,
				atime, 0);
		//if (appointment != null) {
			//out.write(Utils.toJSON(appointment));
		//}
		// appointments = (List<Appointment>)
		// AppDAO.getUserAppointments(user.id);
		// request.setAttribute("appointments", appointments);
		session.setAttribute("appointment", appointment);
		//session.setAttribute("sefa", request.getParameter("action"));
		//response.setContentType("text/html");
		//response.setHeader("title", "Diş Hekimliği Randevu Sistemi");
		//request.getParameter("action");
		response.setCharacterEncoding("utf-8");
		//request.getRequestDispatcher("app/regappo.jsp").include(request, response);
		request.getRequestDispatcher("regappo.jsp").forward(request, response);
		//response.sendRedirect("app/regappo.jsp");
		// TODO Auto-generated method stub
        //out.flush();
        //out.close();
	}

//@SuppressWarnings("unchecked")
//	public void getAllAppointments(HttpServletRequest request,
//			HttpServletResponse response) {
//		UserDAO.User user = (UserDAO.User) request.getSession().getAttribute(
//				"user");
//		int usertype = (Integer) request.getSession().getAttribute("usertype");
//		List<AppDAO.Appointment> appointments = null;
//		if (usertype == UserDAO.USER) {
//			appointments = (List<Appointment>) AppDAO
//					.getUserAppointments(user.id);
//		} else {
//			appointments = AppDAO.getAllAppointments();
//		}
//		request.setAttribute("appointments", appointments);
//		try {
//			request.getRequestDispatcher("/app/showreserv.jsp").forward(
//					request, response);
//		} catch (Exception e) {
//		}
//	}

}
