package beanKomponents;

import jakarta.ejb.Stateful;
import lombok.Getter;
import models.Point;

import java.util.ArrayList;
import java.util.List;


@Getter
@Stateful
public class SessionDataBean {
    private List<Point> dataList;

    public SessionDataBean() {
        dataList = new ArrayList<>();
    }

    public void addData(Point data) {
        dataList.add(data);
    }
}
