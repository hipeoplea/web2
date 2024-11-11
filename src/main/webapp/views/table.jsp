<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.Point" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<div class="table">
    <table class="results">
        <thead>
        <tr class="table-header">
            <th>X</th>
            <th>Y</th>
            <th>R</th>
            <th>Попадание</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Point> points = (List<Point>) request.getSession().getAttribute("result");
        %>
        <%
            if(points!=null){
                for (Point point : points) {
        %>
        <tr>
            <td><%= String.format(Locale.US, "%.2f", point.getX()) %>
            </td>
            <td><%= String.format(Locale.US, "%.2f", point.getY()) %>
            </td>
            <td><%= String.format(Locale.US, "%.2f", point.getR()) %>
            </td>
            <td><%= point.isHit() ? "Да" : "Нет" %>
            </td>
        </tr>
        <% }
        } else {%>
        <tr id="no-data">
            <td colspan="6">Нет данных</td>
        </tr>
        <% }%>
        </tbody>
    </table></div>
</div>