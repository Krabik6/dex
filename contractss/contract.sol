// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
import "@openzeppelin/contracts/utils/Counters.sol";

contract Cryptofy {
    Data data;
    uint256 public  _tokenId;

    mapping(uint256 => address) songOwner;
    mapping(uint256 => uint) songPrice;

   constructor() {
       data = new Data();
       _tokenId = 0;

       uploadSong("first song", 0);
    }

    function getERC1155Address() external view returns(address){
        return address(data);
    }

    function getPrice(uint tokenId_) public pure returns (uint) {
        return tokenId_;
    }

    function uploadSong(string memory uri, uint _price) public {
        _tokenId += 1;
        data.mint(msg.sender, _tokenId, 1, "");
        data.setTokenUri(_tokenId, uri);
        songOwner[_tokenId] = msg.sender;
        songPrice[_tokenId] = _price;
    }

    function buySong(uint256 tokenId_) external payable{
        require(data.balanceOf(msg.sender, tokenId_) == 0, "u alredy have got this song");
        require(msg.value >=  songPrice[tokenId_], "u need more money to buy this song");
        data.mint(msg.sender, tokenId_, 1,  "");
        payable(songOwner[tokenId_]).transfer(msg.value);
    }
//https://gateway.pinata.cloud/ipfs/QmejWam8aFrF7vMLhFffbbкn2Wgcri54c8aV9Tb9HyDk3qu metadata song
//https://gateway.pinata.cloud/ipfs/QmUuMFGWhDHUszkBwz8ReetazoUGinT7iWJKh1Qw8eGfL3 song
    function nftCheck(uint tokenId_) external view returns (bool){
        if(data.balanceOf(msg.sender, tokenId_) > 0){
            return true;
        } else {
            return false;
        }
    }

    //just song
    //payable song
    //buy song
}



import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Data is ERC1155, Ownable {
    

    
    mapping (uint256 => string) private _uris;

    constructor() ERC1155("https://api.otherside.xyz/lands/{id}") {

    }

     function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }
    
    function uri(uint256 tokenId) override public view returns (string memory) {
        return(_uris[tokenId]);
    }
    
    function setTokenUri(uint256 tokenId, string memory uri) public onlyOwner {
        require(bytes(_uris[tokenId]).length == 0, "Cannot set uri twice"); 
        _uris[tokenId] = uri; 
    }
}