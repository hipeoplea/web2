<%@ page import="models.Point" %>
<%@ page import="java.util.List" %>
<%@ page import="beanKomponents.SessionDataBean" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.Locale" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <title>2 лаба</title>

    <link rel="icon" type="image/x-icon" href="static/favicon.ico">
    <link rel="stylesheet" type="text/css" href="static/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Edu+AU+VIC+WA+NT+Guides:wght@400..700&family=Gowun+Batang:wght@400;700&display=swap"
          rel="stylesheet">
</head>
<body>

<div class="wrapp">
    <div class="hat gowun-batang-bold">
        <h1>Черемисова Мария</h1>
        <h3>P3210</h3>
        <h3>409829</h3>
    </div>
    <div class="main gowun-batang-regular">
        <div class="X" id="X">
            <label for="X" class="text"><h2>X:</h2></label>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="-2X" value="-2">
                <label class="label" for="-2X">
                    <div class="indicator"></div>
                    <span class="text">-2</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="-1_5X" value="-1.5">
                <label class="label" for="-1_5X">
                    <div class="indicator"></div>
                    <span class="text">-1.5</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="-1X" value="-1">
                <label class="label" for="-1X">
                    <div class="indicator"></div>
                    <span class="text">-1</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state" name="X" type="radio" id="-0_5X" value="-0.5">
                <label class="label" for="-0_5X">
                    <div class="indicator"></div>
                    <span class="text">-0.5</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="0X" value="0">
                <label class="label" for="0X">
                    <div class="indicator"></div>
                    <span class="text">0</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="0_5X" value="0.5">
                <label class="label" for="0_5X">
                    <div class="indicator"></div>
                    <span class="text">0.5</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="1X" value="1">
                <label class="label" for="1X">
                    <div class="indicator"></div>
                    <span class="text">1</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="1_5X" value="1.5">
                <label class="label" for="1_5X">
                    <div class="indicator"></div>
                    <span class="text">1.5</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state X" name="X" type="radio" id="2X" value="2">
                <label class="label" for="2X">
                    <div class="indicator"></div>
                    <span class="text">2</span>
                </label>
            </div>
        </div>
        <div class="Y">
            <label for="Y" class="text"><h2>Y (-3 ... 5):</h2></label>
            <input type="text" class="textInput" id="Y" name="Y" required minlength="1" maxlength="10"/>

        </div>
        <div class="R" id="R">
            <label class="text" for="R"><h2>R:</h2></label>
            <div class="wrapper">
                <input class="state R" name="R" type="radio" id="1R" value="1">
                <label class="label" for="1R">
                    <div class="indicator"></div>
                    <span class="text">1</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state R" name="R" type="radio" id="2R" value="2">
                <label class="label" for="2R">
                    <div class="indicator"></div>
                    <span class="text">2</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state R" name="R" type="radio" id="3R" value="3">
                <label class="label" for="3R">
                    <div class="indicator"></div>
                    <span class="text">3</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state R" name="R" type="radio" id="4R" value="4">
                <label class="label" for="4R">
                    <div class="indicator"></div>
                    <span class="text">4</span>
                </label>
            </div>
            <div class="wrapper">
                <input class="state R" name="R" type="radio" id="5R" value="5">
                <label class="label" for="5R">
                    <div class="indicator"></div>
                    <span class="text">5</span>
                </label>
            </div>
        </div>
        <button class="btn gowun-batang-bold label" type="submit" id="accept-button">Проверить попадание</button>
    </div>
    <div class="picture" id="graph">
        <svg width="400" height="400">
            <rect class="figure" x="200" y="200" width="100" height="100" fill="rgba(209, 217, 230, 0.80)"></rect>
            <path class="figure" d="M150,200 A 50 50, 270, 0, 0, 200 250 V200 H200"
                  fill="rgba(209, 217, 230, 0.80)"></path>
            <polygon class="figure" points="250,200 200,100 200,200" fill="rgba(209, 217, 230, 0.80)"></polygon>

            <line class="axis" x1="200" x2="210" y1="0" y2="15"></line>
            <line class="axis" x1="200" x2="190" y1="0" y2="15"></line>
            <line class="axis" x1="200" x2="200" y1="0" y2="400"></line>

            <line class="axis" x1="385" x2="400" y1="190" y2="200"></line>
            <line class="axis" x1="385" x2="400" y1="210" y2="200"></line>
            <line class="axis" x1="0" x2="400" y1="200" y2="200"></line>

            <line class="axis" x1="100" x2="100" y1="190" y2="210"></line>
            <line class="axis" x1="150" x2="150" y1="190" y2="210"></line>
            <line class="axis" x1="250" x2="250" y1="190" y2="210"></line>
            <line class="axis" x1="300" x2="300" y1="190" y2="210"></line>
            <line class="axis" x1="190" x2="210" y1="100" y2="100"></line>
            <line class="axis" x1="190" x2="210" y1="150" y2="150"></line>
            <line class="axis" x1="190" x2="210" y1="300" y2="300"></line>
            <line class="axis" x1="190" x2="210" y1="250" y2="250"></line>

            <text x="385" y="180" font-weight="bold">X</text>
            <text x="170" y="15" font-weight="bold">Y</text>

            <text x=90 y=185>-R</text>
            <text x="215" y="305">-R</text>
            <text x="295" y="185">R</text>
            <text x=215 y="105">R</text>
            <text x=130 y=185>-R/2</text>
            <text x=215 y="155">R/2</text>
            <text x="235" y="185">R/2</text>
            <text x="215" y="255">-R/2</text>

            <circle id="answerDot" cx="100" cy="100" r="0" fill="black"></circle>
        </svg>
    </div>
    <div class="table">
        <table class="results">
            <thead>
            <tr class="table-header">
                <th>X</th>
                <th>Y</th>
                <th>R</th>
                <th>Попадание</th>
                <th>Время выполнения программы</th>
                <th>Текущее время</th>
            </tr>
            </thead>
            <tbody>
            <%SessionDataBean data = (SessionDataBean) request.getSession().getAttribute("data");
            if(data != null){
                for (Point point: data.getDataList()){
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
            </tr><%
                    }
            } %>
            </tbody>
        </table>
    </div>
</div>
</body>
<script src="scripts/script.js"></script>
</html>
