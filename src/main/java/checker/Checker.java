package checker;

import models.Point;

import java.util.logging.Logger;

public class Checker {

    static Logger logger  = Logger.getLogger(Checker.class.getName());
    public static boolean check(Point p) {
        double x = p.getX();
        double y = p.getY();
        double r = p.getR();
        boolean square = checkSquare(x, y, r);
        boolean circle = checkCircle(x, y, r);
        boolean triangle = checkTriangle(x, y, r);


//        logger.info("Point: " + p + ", Square: " + square + ", Circle: " + circle + ", Triangle: " + triangle);
        return square || circle || triangle;
    }


    private static boolean checkSquare(double x, double y, double r) {

        return (y >= (-r) && y <= 0) && (x <= r && x >= 0);
    }

    private static boolean checkCircle(double x, double y, double r) {
        return x <= 0 && y <= 0 && x * x + y * y < (r/2) * (r/2);
    }

    private static boolean checkTriangle(double x, double y, double r) {
        boolean xBounds = (0 <= x) && (x <= r/2);
        boolean yBounds = (y >= 0) && (y <= r);
        boolean hypotenuse = (y >= x*0.5 - r);

        return xBounds && yBounds && hypotenuse;
    }

}
