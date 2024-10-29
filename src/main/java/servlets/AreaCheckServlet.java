package servlets;

import beanKomponents.SessionDataBean;
import checker.Checker;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Point;

import java.io.IOException;

import static java.lang.Double.parseDouble;


@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {
    private Point point;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        try {
            Point point = parseRequest(request);
            if (!validatePointValues(point)) {
                throw new NumberFormatException();
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid point");
            return;
        }

        SessionDataBean data = (SessionDataBean) request.getSession().getAttribute("data");
        if (data == null){
            data = new SessionDataBean();
        }

        point.setHit(Checker.check(point));
        Gson gson = new Gson();
        response.getWriter().write(gson.toJson(point));
        data.addData(point);
        request.getSession().setAttribute("data", data);
    }

    private Point parseRequest(HttpServletRequest request)
            throws NumberFormatException {
       Point point = new Point();
       String x = request.getParameter("x");
       String y = request.getParameter("y");
       String r = request.getParameter("z");
       point.setX(parseDouble(x));
       point.setY(parseDouble(y));
       point.setR(parseDouble(r));
       return point;
    }

    private boolean validatePointValues(Point point) {
        return 1 <= point.getR() && point.getR() <= 5 &&
                -2 <= point.getX() && point.getX() <= 2 &&
                -3 <= point.getY() && point.getY() <= 5;
    }
}
