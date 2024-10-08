/*
Functionality:
Has the ability to "mint" NFTs and store them
You should "mint" at least three NFT's
Has the ability to print the details of your NFTs to the console
Has the ability to print the total supply of your NFT collection to the console
*/

const NFTs = []

//contains NFT characteristics
function mintNFT (_name, _eyeColor, _shirtType, _bling) {
    const NFT = {
        "name": _name,
        "eyeColor": _eyeColor,
        "shirtType": _shirtType,
        "bling": _bling
    }
    NFTs.push(NFT);
    console.log("Minted: " + _name);
}

//lists NTFs
function listNFTs () {
    for(let i = 0; i <NFTs.length; i++){
        console.log("\nID: \t\t\t\t" + (i + 1));
        console.log("Name: \t\t\t" + NFTs[i].name);
        console.log("Eyecolor: \t" + NFTs[i].eyeColor);
        console.log("Shirt Type: " + NFTs[i].shirtType);
        console.log("Bling: \t\t\t" + NFTs[i].bling);
    }
}

//outputs total number of NFTs
function getTotalSupply() {
    console.log("\n" + NFTs.length);
}


mintNFT ("Bogart", "Black", "T-shirt", "Plastic");
mintNFT ("Bogarta", "White", "Dress", "Plastic");
mintNFT ("Mondragon", "Gold", "Dress", "Golden Accesories");
mintNFT ("Purita", "Black", "Potato Sack", "Nothing");
listNFTs ();
getTotalSupply();
