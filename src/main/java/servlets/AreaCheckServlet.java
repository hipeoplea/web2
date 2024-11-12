package servlets;

import checker.Checker;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Point;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import static java.lang.Double.parseDouble;

@WebServlet("/areaCheck")
public class AreaCheckServlet extends HttpServlet {

    Logger logger = Logger.getLogger(AreaCheckServlet.class.getName());

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try {

            Point point = parseRequest(request);
            if (!validatePointValues(point)) {
                throw new NumberFormatException();
            }

            point.setHit(Checker.check(point));
            List<Point> dots = (List<Point>) request.getSession().getAttribute("result");
            if (dots == null) {
                dots = new ArrayList<>();
            }
            dots.add(point);
            logger.info("Stateful bean" + dots);
            logger.info("Stateless bean" + point);
            request.getSession().setAttribute("result", dots);
            request.getSession().setAttribute("point", point);
            Gson gson = new Gson();
            response.getWriter().write(gson.toJson(point));
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid point");
        }
    }

    private Point parseRequest(HttpServletRequest request) throws NumberFormatException {
        Point point = new Point();
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String r = request.getParameter("r");
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
