//gets the balance of the owners address
balanceOf(address _owner)constant returns(uint256 balance);

//sends _value amount of token to address _to 
function transfer(address _to, uint256 value) returns (bool success);

//send _value amount of token from address _from to address _to
function transferFrom(address _from, address _to, uint256 _value) returns(bool success);

//this method is used to withdraw fund from a contract, allowing sending of tokens at will, such as deposit ether to a contract address or charge in form of tokens it fails unless msg.send gets approval _from account somehow
//best used after getting approval

function allowance(address _owner, address _spender) constant returns(uint256 remaining);
//returns amount of token in which _spender can send from _owner's account

event Transfer(address indexed _from, address indexed _to, uint256 _value) 
//triggered when the token is transferred

event Approval(address indexed _owner, address indexed _spender, uint256 _value)
//triggered when approve(address _spender, uint256 _value is called)



