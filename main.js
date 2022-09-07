async function hello(url) {
const response = await fetch(url);
const result = await response.json(); // читаем ответ в формате JSON

let author = document.createElement('div');
author.innerHTML = result.author;
document.body.appendChild(author);

let image = document.createElement('img');
image.src = result.image
document.body.appendChild(image);

let name = document.createElement('div');
name.innerHTML = result.name;
document.body.appendChild(name);

let aud = new Audio();
aud.src = result.song
aud.type = 'audio/mp4'
aud.controls = true
document.body.appendChild(aud);

let description = document.createElement('div');
description.innerHTML = result.description;
document.body.appendChild(description);
}

hello("https://gateway.pinata.cloud/ipfs/QmWTubScwHpFh6XMK2EPXr8kEvqY94rv8oDZBDXoP3HCLr")

hello("https://gateway.pinata.cloud/ipfs/QmWTubScwHpFh6XMK2EPXr8kEvqY94rv8oDZBDXoP3HCLr")