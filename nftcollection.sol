// / SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CryptoBoys is ERC721Enumerable, Ownable{

    string _baseTokenURI;
    uint256 public _price = 0.01 ether; // price of one cryptoboys nft 
    bool public _paused; 
    uint256 public maxTokenIds = 50; // max no. of cryptoboys tokens 
    uint256 public tokenIds; // minted tokenIds 

    modifier onlyWhenNotPaused{
        require(!_paused, "Contract is currently Paused");
        _;
    }

    // constructor takes the name and symbol, and is used to set the _baseTokenURI for the collection 
    constructor(string memory baseURI) ERC721("Crypto Boys", "CB"){
        _baseTokenURI = baseURI; 
    }

    function mint() public payable onlyWhenNotPaused{
        require(tokenIds < maxTokenIds, "Exceeded maximum CryptoBoys Supply");
        require(msg.value >= _price, "Ether sent is Not correct");
        tokenIds += 1; 
        _safeMint(msg.sender, tokenIds);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

     function setPaused(bool val) public onlyOwner {
        _paused = val;
    }

    function withdraw() public onlyOwner{
        address _owner = owner();
        uint256 amount = address(this).balance;
        (bool sent, ) = _owner.call{value: amount}("");
        require(sent, "Failed to sent the ether");
    }

    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}
}