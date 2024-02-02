# Bank

# Write a Bank contract:

• Contract Function Description
• Deposit:
Users can deposit Ethereum into the bank by calling this function.
The deposit must be greater than zero.
After depositing, the balance will update and trigger the Deposited event.
• Withdrawal:

Users can withdraw the balance from their own account.
The withdrawal amount must be less than or equal to the user's balance.
After withdrawal, the balance will be updated and the Withdrawal event will be triggered.
• Query balance (getBalance):
Users can check their bank balance.
This feature will trigger the Balance Checked event to record the query.

• User registration:
Users can register by calling this function.
Each user can only register once, and the UserRegistered event will be triggered after registration.


# 编写一个Bank 合约:

• 合约功能：
• 存款 (deposit)：
用户可以通过调用此函数将以太币存入银行。
存款必须大于零。
存款后，余额会更新并触发 Deposited 事件。
• 取款 (withdraw)：

用户可以提取自己账户上的余额。
提取金额必须小于或等于用户的余额。
取款后，余额会更新并触发 Withdrawn 事件。
• 查询余额 (getBalance)：
用户可以查询自己在银行的余额。
此功能会触发 BalanceChecked 事件以记录查询。

• 用户注册 (register)：
用户可以通过调用此函数进行注册。
每个用户只能注册一次，注册后会触发 UserRegistered 事件。
