    // SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract XRPLBridge is IERC721Receiver {

    struct NFTBridgeData {
            address contractAddress;
            address originOwner;
            uint256 tokenId;
            string xrplAddress;
            uint blockNumber;
        }


    NFTBridgeData[] private _nftBridgeData;

    event NFTReceived(address _from, uint256 _tokenId, string xrplAddress);    

    constructor() {}


    function BridgeETHToXRPL(IERC721 nft, uint256 _tokenId, string memory _xrplAddress) public {
        require(nft.ownerOf(_tokenId) == msg.sender, "NOT OWNER");
        _nftBridgeData.push(NFTBridgeData(address(nft), address(msg.sender),_tokenId, _xrplAddress, block.number));
        nft.safeTransferFrom(msg.sender, address(this),_tokenId);
        emit NFTReceived(msg.sender, _tokenId, _xrplAddress);
    }

    function onERC721Received(address , address , uint256 , bytes memory) external pure override returns (bytes4){
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }

    function returnBridgeNFTs(uint _blockNumber)
        external
        view
        returns (NFTBridgeData[] memory)
    {
        uint256 totalNFTs = _nftBridgeData.length;
        uint256 arrayLength = 0;

        for (uint256 i = 0; i < totalNFTs; i++) {
            if(_nftBridgeData[i].blockNumber > _blockNumber)
            {
                arrayLength ++;
            }
        }

        NFTBridgeData[] memory _returnObject = new NFTBridgeData[](arrayLength);
        uint256 arrayIterator = 0;
        for (uint256 i = 0; i < totalNFTs; i++) {
            if(_nftBridgeData[i].blockNumber > _blockNumber)
            {
               _returnObject[arrayIterator] = _nftBridgeData[i];
               arrayIterator ++;
            }
        }
        return _returnObject;
    }

    function returnAllBridgeNFTs()
        external
        view
        returns (NFTBridgeData[] memory)
    {
        NFTBridgeData[] memory _returnObject = new NFTBridgeData[](_nftBridgeData.length);
        for (uint256 i = 0; i < _nftBridgeData.length; i++) {
            _returnObject[i] = _nftBridgeData[i];
        }
        return _returnObject;
    }

    function returnBridgeNFTsByWallet(address _originOwner)
        external
        view
        returns (NFTBridgeData[] memory)
    {
        uint256 totalNFTs = _nftBridgeData.length;
        uint256 arrayLength = 0;

        for (uint256 i = 0; i < totalNFTs; i++) {
            if(_nftBridgeData[i].originOwner == _originOwner)
            {
                arrayLength ++;
            }
        }

        NFTBridgeData[] memory _returnObject = new NFTBridgeData[](arrayLength);
        uint256 arrayIterator = 0;
        for (uint256 i = 0; i < totalNFTs; i++) {
            if(_nftBridgeData[i].originOwner == _originOwner)
            {
               _returnObject[arrayIterator] = _nftBridgeData[i];
               arrayIterator ++;
            }
        }
        return _returnObject;
    }
}