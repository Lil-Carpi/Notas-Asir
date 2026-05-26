let div = document.getElementById("divs");
div.addEventListener("mouseover", si);
main = 0
hover = 0

function si () {
    if (hover === 0) {
        div.innerHTML = main;
        main++;
        hover = 1;
    } if (hover == 1) {
        div.innerHTML = main;
        hover = 0;
    }

    if (main >= 49) {
        div.style.color="green";
    } else {
        div.style.color="red";
    }
}