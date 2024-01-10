// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Bank{

//setAdmin
address public admin;
//balances User address => amount
mapping(address => uint) public userBalances;

//top3 
address[3] public top3Address;

//totalBalances
uint256 public  totalBalances=0;
constructor() {
    admin=msg.sender;
}


function deposit() public  payable{
    require(msg.value>0,"eth must be greater than 0");
    uint256 data =userBalances[msg.sender]+msg.value;
    userBalances[msg.sender]=data;
    totalBalances=totalBalances+msg.value;
    sort(msg.sender,data);


} 
function sort(address s, uint256 data) internal {

        uint256 min = data;
        uint8 index = 3;
        for (uint8 i = 0; i < 3; i++) {
            //exixt 
            if (top3Address[i] == s) {
                index = 3;
                break;
            }
            if (userBalances[top3Address[i]] < min) {
                min = userBalances[top3Address[i]];
                index = i;
            }
        }
        if (index < 3) {
            top3Address[index] = s;
        }
}
function getTop3() public view returns(address[3] memory){
return top3Address;
}

function withdraw()public {
require(msg.sender==admin,"only admin can withdraw eth");
payable(msg.sender).transfer(totalBalances);
}
}