pragma solidity^0.4.0;
contract MyToken {
    address public creator;//address which saves the owner of the contract

    uint256 public totalSupply;//saves the total token amount

    mapping(address => uint256)public balances;//dictionary mapping that saves the total amount of token in a specific address

    //Account balances
    function MyToken() public {
        creator = msg.sender;//sets the owner of the contract
        totalSupply = 10000;
        balances[creator] = totalSupply;//storing the tokens in the creators account
        }

        function balanceOf(address owner) public constant returns (uint256) {
        return balances[owner];
        }

//function that allows transfer of tokens, it takes an adress and the amount
    function sendTokens(address receiver, uint256 amount) public returns(bool) {
        address owner = msg.sender;//assigns the  address of the owner to the sender
        require(amount > 0);//check to ensure the sender actually has the money
        require(balances[owner] >= amount);//the money in the account has to be greater than that intended to be sent
        balances[owner] -= amount;
        balances[receiver] += amount;
        return true;
    }
}





}
