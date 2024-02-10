# Bank

# Write a Bank contract:

* Contract Function Description

#### Deposit:

* Users can deposit Ethereum into the bank by calling this function.
The deposit must be greater than zero.
After depositing, the balance will update and trigger the Deposited event.
#### Withdrawal:

* Users can withdraw the balance from their own account.
The withdrawal amount must be less than or equal to the user's balance.
After withdrawal, the balance will be updated and the Withdrawal event will be triggered.
#### Query balance (getBalance):

* Users can check their bank balance.
This feature will trigger the Balance Checked event to record the query.

#### User registration:

* Users can register by calling this function.
Each user can only register once, and the UserRegistered event will be triggered after registration.

#### Pledge asset function (deposit collateral):

* Users can deposit Ethereum into the contract as collateral.
The pledged amount will be recorded and trigger the CollateralReported event.

#### Apply for a loan (applyForLoan):

* Users can apply for loans based on the value of their pledged assets, and the loan amount cannot exceed 70% of the pledged value.
The verification logic for loan amount has been added.

#### Check for Liquidation:

* Users can call this function to check if their loan exceeds 75% of the pledged assets.
If the loan amount exceeds this threshold, the contract will trigger a liquidation event and clear the user's loan and pledged assets.

#### Query Pledge Balance (getCollateralBalance):

* Users can view their current balance of pledged assets.


# 编写一个Bank 合约:

### 合约功能：
#### 存款 (deposit)：

* 用户可以通过调用此函数将以太币存入银行。
存款必须大于零。
存款后，余额会更新并触发 Deposited 事件。
#### 取款 (withdraw)：

* 用户可以提取自己账户上的余额。
提取金额必须小于或等于用户的余额。
取款后，余额会更新并触发 Withdrawn 事件。
#### 查询余额 (getBalance)：
用户可以查询自己在银行的余额。
此功能会触发 BalanceChecked 事件以记录查询。

#### 用户注册 (register)：
* 用户可以通过调用此函数进行注册。
每个用户只能注册一次，注册后会触发 UserRegistered 事件。

#### 质押资产功能 (depositCollateral)：
* 用户可以将以太币存入合约作为质押。
质押金额会被记录，并触发 CollateralDeposited 事件。

#### 申请贷款 (applyForLoan)：
* 用户可以根据其质押资产的价值申请贷款，贷款金额不能超过质押价值的 70%。
贷款金额的验证逻辑已添加。

#### 检查平仓 (checkForLiquidation)：
* 用户可以调用此函数来检查其贷款是否超过质押资产的 75%。
如果贷款金额超过此阈值，合约将触发平仓事件，并清除用户的贷款和质押资产。

#### 查询质押余额 (getCollateralBalance)：
* 用户可以查看其当前的质押资产余额。
### 代码仅为示例代码，具体实现可能需要根据实际需求进行调整。
