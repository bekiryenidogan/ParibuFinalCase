// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract WhiteBlackList {

    //Seting owner of the contract     
    address private owner = msg.sender;
    
    // Number of accounts Whitelisted
    uint32 public numAddressesWhitelisted;

    //Number of accounts Blacklisted
    uint32 public numAddressesBlacklisted;

    //Check if the address is in the whitelist
    mapping(address => bool) public whitelistedAddresses;
    
    //Check if the address is in the blacklist
    mapping (address =>bool) public blacklistedAddresses;

    //Makes it only available for the owner
    modifier onlyOwner() {
        require(owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    // Check if the signer is on the whitelist
    modifier  isWhitelisted() {
         require(whitelistedAddresses[msg.sender] ==true,"You aren't on the whitelist");
         _;
    }

    // Check if the signer is on the blacklist
    modifier isBlacklisted(){
        require(blacklistedAddresses[msg.sender] ==false,"You are in the Blacklist");
        _;
    }

    // Add account to whitelist
    function addToWhiteList (address _addressToWhitelist) external  onlyOwner {
        require(!whitelistedAddresses[_addressToWhitelist], "Sender has already been whitelisted");
        require(!blacklistedAddresses[_addressToWhitelist],"user is on the blacklist");

        whitelistedAddresses[_addressToWhitelist]= true;
        numAddressesWhitelisted++;
    }

    // Remove account from whitelist
    function removeFromWhitelist ( address _addressToWhitelist) external   onlyOwner {
        whitelistedAddresses[_addressToWhitelist] = false;
        numAddressesWhitelisted--;
    }

    // Add account to blacklist
    function addToBlacklist ( address  _addressToBlacklist) external  onlyOwner {
        require(!whitelistedAddresses[_addressToBlacklist], "The user is on  whitelisted");
        require(!blacklistedAddresses[_addressToBlacklist],"Sender has already been blacklist");
        blacklistedAddresses[_addressToBlacklist] = true;
        numAddressesBlacklisted++;
    }
    
    // Remove account from blacklist
    function removeFromBlacklist (address _addressToBlacklist) external   onlyOwner {
        blacklistedAddresses[_addressToBlacklist] = false;
        numAddressesBlacklisted--;
    }


}