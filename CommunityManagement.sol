// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "WhiteBlackList.sol";

contract CommunityManagament is WhiteBlackList{

    address payable owner;

     struct Community {
        string communityName;
        uint32 maxPlayer;
        address[] player;
        uint fee;
    }

    Community[] public communities;

    constructor(){
        owner = payable (msg.sender);
    }

    function createCommunity (string memory _name, uint32  _maxplayer,uint  _fee,address[] memory _player)external  onlyOwner {
        
        Community memory community;        
        community.communityName = _name;
        community.maxPlayer = _maxplayer;
        community.player = _player;
        community.fee = _fee;
   
        communities.push(community);
    }

    function getCommunity(uint32 _communityId) public view returns (Community memory){
        require(_communityId<=communities.length,"Out of bounds");
        return  communities[_communityId];

    }

    function joinCommunity(uint256 id) external payable  isBlacklisted isWhitelisted {
        require(communities[id].maxPlayer>=communities[id].player.length,"Community is Full");
        require(msg.value == communities[id].fee * 1 ether,"Incorrect amount of ether");
        require(msg.value< msg.sender.balance,"You dont have enough money");
        
        (bool success,) = owner.call{value: msg.value}("");
        require(success, "Failed to send money");



        for (uint i=1;i<communities[id].player.length;i++) {

            if (communities[id].player[i] == msg.sender) {
                revert("User is already in the community");
            
            }
         } 
         
       communities[id].player.push(msg.sender);
      
    }

    function isUser(uint256 id,address kickPlayerIndex) internal view onlyOwner returns (uint find){
        bool finded;
        for (uint i=0;i< communities[id].player.length; i++) 
        {
            if (communities[id].player[i] == kickPlayerIndex) {
                finded == true;
                return  i;
                
            }
        }
        if (!finded) {
            revert("There is no people with this address");
        }
            
    }
     function remove(uint communityId,uint playerIndex) private onlyOwner{
            communities[communityId].player[playerIndex] = communities[communityId].player[communities[communityId].player.length - 1];
            communities[communityId].player.pop();
    }

    function kickPlayer(uint256 id, address kickedPlayer) external  onlyOwner{
        remove(id,isUser(id, kickedPlayer));
    
     }
}



