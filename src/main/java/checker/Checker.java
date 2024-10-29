package checker;

import models.Point;

public class Checker {

    public static boolean check(Point p) {
        double x = p.getX();
        double y = p.getY();
        double r = p.getR();
        return checkSquare(x, y, r) || checkCircle(x, y, r) || checkTriangle(x, y, r);
    }


    private static boolean checkSquare(double x, double y, double r) {

        return (y >= (-r) && y <= 0) && (x <= r && x >= 0);
    }

    private static boolean checkCircle(double x, double y, double r) {
        return x <= 0 && y <= 0 && x * x + y * y < (r/2) * (r/2);
    }

    private static boolean checkTriangle(double x, double y, double r) {
        boolean xBounds = (0 >= x) && (x <= r/2);
        boolean yBounds = (y >= 0) && (y <= r);
        boolean hypotenuse = (y >= 0.5 * x - r);

        return xBounds && yBounds && hypotenuse;
    }

}
