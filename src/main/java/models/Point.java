package models;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Point {
    private double X;
    private double Y;
    private double R;
    private boolean isHit;
}
