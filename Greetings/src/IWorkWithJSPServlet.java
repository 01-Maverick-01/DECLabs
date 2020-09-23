

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class IWorkWithJSPServlet
 */
@WebServlet("/greetingsServletNew")
public class IWorkWithJSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IWorkWithJSPServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "Hello " + request.getParameter("name") + "!";
		Object counter = request.getSession().getAttribute("counter");
		int counterVal;
		if (counter == null) {
			request.getSession().setAttribute("counter", "1");
			counterVal = 1;
		} else {
			request.getSession().setAttribute("counter", Integer.parseInt(counter.toString()) + 1);
			counterVal = Integer.parseInt(counter.toString()) + 1;
		}
		msg += "\nYou visited " + counterVal + " times!!";
		request.setAttribute("personalizedGreeting", msg);
		RequestDispatcher rs = request.getServletContext().getRequestDispatcher(
				"/WEB-INF/jsp/NewGreetingsJSP.jsp");
		rs.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
