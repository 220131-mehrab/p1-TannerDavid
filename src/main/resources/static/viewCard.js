let canvas = document.getElementById('addCardCanvas');
let canvasWidth = window.innerWidth * .40;
let canvasHeight = window.innerHeight * .50;
let ctx = canvas.getContext("2d");
let exCardImg = document.getElementById('exCardImg');
let count = 0;
let exCardSettle = false;
let exCardPhase1 = false;
let exCardPhase2 = false;
let exCardPhase3 = false;
let exCardImageLeft = -30;
let exCardImageHeight = 0;
let urlString = window.location.href;
let cardString = urlString.split('=')[1];
let cardString2 = new URLSearchParams(cardString);
let cardString2Length = cardString2.toString().length-1;
let cardIdString = cardString2.toString().substring(0,cardString2Length);
let cardURLFirstChar = cardIdString.toString().substring(0,1);
let cardURLSecondChar = cardIdString.toString().substring(1,2);
let cardURL = "https://c1.scryfall.com/file/scryfall-cards/normal/front/"+cardURLFirstChar+"/"+cardURLSecondChar+"/"+cardIdString+".jpg?1562440211";
exCardImg.src = cardURL;



fetch('/cards').then(resp => resp.json()).then(cards => {
    document.querySelector('#cardsDiv').innerHTML = listCards(cards);
});

window.onload = function() {
    canvas.width = canvasWidth;
    canvas.height = canvasHeight;

    let fps = 30;
    setInterval(DrawImage, 1000/fps);
}

function ColorRect (leftX, topY, boxWidth, boxHeight, fillColor) {
    if (fillColor !== "Clear") {
        ctx.fillStyle = fillColor;
        ctx.fillRect(leftX, topY, boxWidth, boxHeight);
    } else
        ctx.reset();
}

function DrawImage() {
    ColorRect(0,0, canvasWidth, canvasHeight, "Clear");
    ctx.drawImage(exCardImg, exCardImageLeft, exCardImageHeight,exCardImg.width/1.4,exCardImg.height/1.4);

    if (!exCardSettle && !exCardPhase1 && !exCardPhase2) {
        // if Example Card hasn't settled into place on the canvas.
        exCardImageLeft += 15;
        if (exCardImageLeft >= 190) {
            exCardSettle = true;
            exCardImageLeft -= 20;
        }
    }

    if (exCardSettle && !exCardPhase1 && !exCardPhase2) {
        // if exCard has gone as far from left as intended, but not gone toward left yet.
        exCardImageLeft -= 5;
        if (exCardImageLeft <= 120) {
            exCardPhase1 = true;
            exCardImageLeft += 8;
        }
    }

    if (exCardSettle && exCardPhase1 && !exCardPhase2) {
        // If card has gone as far from the left as intended, has gone a little more toward the left, but not travelled back.
        exCardImageLeft += 7;
        if (exCardImageLeft >= 180)
            exCardPhase2 = true;
    }

    if (exCardSettle && exCardPhase1 && exCardPhase2 && !exCardPhase3) {
        // If card has finished the longer routes, and needs to settle 3 points behind
        exCardImageLeft -= 5;
        if (exCardImageLeft <= 150) {
            exCardPhase3 = true;
            parchmentImgLeft = exCardImageLeft;
        }
    }
}

function listCards(json) {
    return `${json.map(listCard).join('\n')}`;
}

let listCard = function(card) {
    // return '<image src="https://gatherer.wizards.com/Handlers/Image.ashx?multiverseid='+card.multiverse+'&type=card">';
    // return '<p>' + card.cardId + ": " + card.cost + ": " + card.typeId + ": " + card.name + ": " + card.artist + ": " +
    //     card.colorIdentity + ": " + card.multiverse + ": " + card.rarity + ": " + card.power + ": " + card.toughness + '</p>';
}



function postCard() {
    let card = {
        "cardId": document.getElementById("cardId").value,
        "cost": document.getElementById("cost").value,
        "typeId": document.getElementById("typeId").value,
        "name": document.getElementById("name").value,
    }
    console.log(card);
    fetch("/cards", {
        method: "POST",
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(card)
    }).then((result) => {
        if (result.status != 200) {
            throw new Error("Bad Server Response");
        }
        console.log(result.text());
    }).catch((error) => { console.log(error); })
    fetch('/cards').then(resp => resp.json()).then(cards => {
            document.querySelector('#cardsDiv').innerHTML = listCards(cards);
        }
    );
    window.document.location.reload();
}
function goToButton(goToUrl) {
    window.location.href=goToUrl;
}