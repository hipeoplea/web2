const ANSWERS = {
    X_ERROR: "Неверный X или X не введён!",
    Y_ERROR: "Пожалуйста, выберите Y",
    R_ERROR: "Пожалуйста, выберите R",
    HIT_RESULT: {
        true: "Да",
        false: "Нет"
    },
    API: '/webLab2/controller',
    HIT_COLOUR: {
        true: "green",
        false: "red"
    }
};

function getValidatedY() {
    const yInput = document.querySelector('#Y');
    let y = parseFloat(yInput.value);

    let validationResult = !isNaN(y) && y <= 5 && y >= -3;
    if (validationResult === false) yInput.value = "";
    return validationResult ? y : null;
}

function getValidatedXR(n) {
    const Inp = document.getElementsByName(n);
    for (let i = 0; i < Inp.length; i++) {
        if (Inp[i].type === "radio" && Inp[i].checked) {
            return parseInt(Inp[i].value);
        }
    }
    return null;
}

async function validateInput(event) {
    event.preventDefault();
    const xRes = getValidatedXR('X');
    const yRes = getValidatedY;
    const rRes = getValidatedXR('R');

    if (xRes == null || yRes == null || rRes == null) {
        if (xRes == null) alert(ANSWERS.X_ERROR);
        if (yRes == null) alert(ANSWERS.Y_ERROR);
        if (rRes == null) alert(ANSWERS.R_ERROR);
        return;
    }
    sendRequestAndHandleResponse(xRes, yRes, rRes);
}


async function validateInputFromMouse(event) {
    const svg = event.currentTarget;
    const rect = svg.getBoundingClientRect();
    const svgWidth = rect.width;
    const svgHeight = rect.height;
    const xRange = [-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2];
    const r = getValidatedXR('R');

    if (r == null) {
        alert("Пожалуйста, выберите значение R");
        return;
    }
    const x = event.clientX - rect.left - svgWidth / 2;
    const y = svgHeight / 2 - (event.clientY - rect.top);

    const scaledX = ((x / (svgWidth / 2)) * r * 2);
    const scaledY = ((y / (svgHeight / 2)) * r * 2);

    console.log(`Clicked coordinates: x = ${scaledX}, y = ${scaledY}`);

    const nearestX = closestValueInRange(scaledX, xRange);
    if (nearestX === null) {
        alert("Координаты находятся за пределами диапазона X");
        return;
    }
    if (scaledY <= -3 || scaledY >= 5) {
        alert("Координаты находятся за пределами диапазона Y");
        return;
    }
    console.log(`Nearest coordinates : ${nearestX}}`);
    sendRequestAndHandleResponse(nearestX, scaledY, r);

}

function sendRequestAndHandleResponse(x, y, r) {
    const request = {
        method: "Get",
    }
%
    fetch(`/webLab2/controller?x=${x}&y=${y}&z=${z}`, request)
        .then(response => {
            if (response.ok) {
                return response.headers;
            } else {
                console.error('Send error: ', response.statusText);
            }
        })
        .then(data => {
            if (data) {
                console.log(data);
                addDataRow(data["x"], data["y"], data["r"], data["isHit"]);
                writeDotResult(data["x"], data["y"], data["r"], data["isHit"]);
            }
        })
        .catch(error => console.error("Fetch error: ", error));
}


function closestValueInRange(value, range) {

    const min = range[0];
    const max = range[range.length - 1];

    if (value < min || value > max) {
        return null;
    }

    let closest = range[0];
    let closestDiff = Math.abs(value - closest);

    for (let i = 1; i < range.length; i++) {
        const currentDiff = Math.abs(value - range[i]);
        if (currentDiff < closestDiff) {
            closest = range[i];
            closestDiff = currentDiff;
        }
    }

    return closest;
}

async function writeDotResult(xResult, yResult, rResult, hit) {
    let passDot = document.getElementById('answerDot');
    let rSize = 400 / (rResult * 4)

    passDot.setAttribute("cx", 200 + xResult * rSize);
    passDot.setAttribute("cy", 200 - yResult * rSize);
    passDot.setAttribute("r", 3);
    passDot.setAttribute("fill", ANSWERS.HIT_COLOUR[hit]);

}


document.querySelector("#accept-button")
    .addEventListener("click", (event) => validateInput(event));
document.querySelector("svg")
    .addEventListener("click", (event) => validateInputFromMouse(event));