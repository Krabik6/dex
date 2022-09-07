const pinataSDK = require('@pinata/sdk');
const pinata = pinataSDK('72b2ec1ce6cf463a4920', '8221fd87cf7c400ef0710b76c4fd23b85425568aaefc60c6c11d0dc4e3e5b126');
const fs = require('fs');

const readStram = fs.createReadStream('./text.txt')
// let data = fs.createReadStream(path[ options])

pinata.pinFileToIPFS(readStram).then((result) => {
    //handle results here
    console.log(result);
}).catch((err) => {
    //handle error here
    console.log(err);
});
