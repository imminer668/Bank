# Bank

# Write a Bank contract:

• Deposit to Bank contract via Metamask (transfer ETH)

• Record the deposit amount at each address in the Bank contract

• Write the Bank contract withdraw() so that only the administrator withdraws all ETH

• Record the top 3 deposits with an array

Idea:

Since there are not many rankings to remember, every time I deposit a deposit, I will compare whether the amount is higher than the top three.
Perhaps subsequent optimization, record the first three minimum values of the address and the amount, reduce the number of loop comparison


# 编写一个Bank 合约:

• 通过 Metamask 向Bank合约存款(转账ETH)

• 在Bank合约记录每个地址存款金额

• 编写 Bank合约 withdraw(), 实现只有管理员提取出所有的 ETH

• 用数组记录存款金额前 3 名

思路：

由于需要记得的排名不多，每次deposit存款的时候就对比金额是否比前三大，
或许后续优化，记录下前三中的最小值的address以及金额，减少循环对比次数
