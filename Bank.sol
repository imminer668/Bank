// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    //setAdmin
    address admin;
    //balances User address => amount
    mapping(address => uint) public userBalances;

    //top3
    address[3] public top3Address;

    //totalBalances
    uint256 public totalBalances = 0;

    event Deposit(
        address user,
        uint256 value,
        uint256 userBalances,
        uint256 totalBalances
    );
    event Top3Is(address user1, address user2, address user3);
    event WithdrawWithAdmin(address user, uint256 value);
    event Withdraw(address user, uint256 value);

    constructor() {
        admin = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Eth must be greater than 0.");
        uint256 data = userBalances[msg.sender] + msg.value;
        userBalances[msg.sender] = data;
        totalBalances = totalBalances + msg.value;
        sort(msg.sender, data);
        emit Deposit(msg.sender, msg.value, data, totalBalances);
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
        emit Top3Is(top3Address[0], top3Address[1], top3Address[2]);
    }

    function getTop3() public view returns (address[3] memory) {
        return top3Address;
    }

    function withdrawWithAdmin() public {
        require(msg.sender == admin, "Only admin can withdraw eth.");
        payable(msg.sender).transfer(totalBalances);
        emit WithdrawWithAdmin(msg.sender, totalBalances);
        totalBalances = 0;
    }

    function withdraw(uint256 amount) public {
        require(userBalances[msg.sender] > 0, "Your eth balances is 0.");
        require(
            userBalances[msg.sender] >= amount,
            "Your balances not enough."
        );

        if (amount == 0) {
            //withdraw all
            payable(msg.sender).transfer(userBalances[msg.sender]);
            emit Withdraw(msg.sender, userBalances[msg.sender]);
            totalBalances -= userBalances[msg.sender];
            userBalances[msg.sender] = 0;
        } else {
            payable(msg.sender).transfer(amount);
            emit Withdraw(msg.sender, amount);
            totalBalances -= amount;
            userBalances[msg.sender] -= amount;
        }
    }
}
