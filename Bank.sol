// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    // Maps each address's balance
    mapping(address => uint256) private balances;
    // Stores whether a user is registered
    mapping(address => bool) private registeredUsers;
    // Stores each user's loan balance
    mapping(address => uint256) private loanBalances;
    // Loan interest rate (assumed to be 10%)
    uint256 private constant LOAN_INTEREST_RATE = 10;

    // Deposit event
    event Deposited(address indexed account, uint256 amount);
    // Withdrawal event
    event Withdrawn(address indexed account, uint256 amount);
    // Balance inquiry event
    event BalanceChecked(address indexed account, uint256 balance);
    // User registration event
    event UserRegistered(address indexed account);
    // Loan issuance event
    event LoanIssued(address indexed account, uint256 amount);
    // Loan repayment event
    event LoanRepaid(address indexed account, uint256 amount);

    // User registration function
    function register() public {
        require(!registeredUsers[msg.sender], "User already registered");

        // Register the user
        registeredUsers[msg.sender] = true;

        // Emit the registration event
        emit UserRegistered(msg.sender);
    }

    // Deposit function
    function deposit() public payable {
        require(msg.value > 0, "You must deposit some ether");
        
        // Update user's balance
        balances[msg.sender] += msg.value;
        
        // Emit the deposit event
        emit Deposited(msg.sender, msg.value);
    }

    // Withdrawal function
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        
        // Update balance
        balances[msg.sender] -= amount;
        
        // Transfer the amount
        payable(msg.sender).transfer(amount);
        
        // Emit the withdrawal event
        emit Withdrawn(msg.sender, amount);
    }

    // Balance inquiry function
    function getBalance() public returns (uint256) {
        uint256 balance = balances[msg.sender];
        
        // Emit the balance inquiry event
        emit BalanceChecked(msg.sender, balance);
        
        return balance;
    }

    // Loan application function
    function applyForLoan(uint256 amount) public {
        require(registeredUsers[msg.sender], "User not registered");
        require(amount > 0, "Loan amount must be greater than zero");
        
        // Issue the loan
        loanBalances[msg.sender] += amount;

        // Transfer the loan amount
        payable(msg.sender).transfer(amount);
        
        // Emit the loan issuance event
        emit LoanIssued(msg.sender, amount);
    }

    // Loan repayment function
    function repayLoan(uint256 amount) public payable {
        require(registeredUsers[msg.sender], "User not registered");
        require(loanBalances[msg.sender] > 0, "No outstanding loan to repay");
        require(msg.value >= amount, "Insufficient repayment amount");

        // Calculate the interest
        uint256 totalRepayment = (loanBalances[msg.sender] * (100 + LOAN_INTEREST_RATE)) / 100;

        require(amount >= totalRepayment, "Repayment must cover the full loan and interest");

        // Update the loan balance
        loanBalances[msg.sender] = 0;

        // Emit the loan repayment event
        emit LoanRepaid(msg.sender, amount);
    }

    // Loan balance inquiry function
    function getLoanBalance() public view returns (uint256) {
        return loanBalances[msg.sender];
    }
}