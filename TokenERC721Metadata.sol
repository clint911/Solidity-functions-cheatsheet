contract TokenERC721Metadata is TokenERC721, ERC721Metadata{
	//metadata extension has the following 3 functions
	function name()external view returns(string _name);
	//can be called from outside the functions,it only views and does not write data to the block-chain and returns a local variable
	function symbol()external view returns (string _symbol);
	function tokenURI(uint256 _tokenId)external view returns(string);
	//this will be called immediately the contraact is deployed
	constructor(uint _initialSupply,string _name,string _symbol,string _uriBase)
	
	public TokenERC721(_initialSupply){
	 __name = _name;
	 __symbol = __symbol;
	 __uriBase = bytes(_uriBase);
	 //add to ERC165 Interface Check
	 supportedInterfaces[
		 this.name.selector^
		 this.symbol.selector^
		 this.tokenURI.selector
	 ]=true;
	}
	function name() external view returns(string _name){
		_name = __name;
	}
	function symbol() external view returns (string _symbol){
		_symbol = __symbol;
	}
	function TokenURI(uint256 _tokenId)external view returns(string) { 
		//to Check if a token is valid,it should pass the local variable tokenId
		require(isValidToken(_tokenId));
		uint256 maxLength = 78;
		bytes memory reversed = new bytes(maxLength);
		uint i = 0;
		//loop and add byte into array
		while (_tokenId != 0) {
		uint remainder = _tokenId % 10;
		_tokenId /= 10;
		_tokenId /= 10;
		reversed[i++] = byte(48 + remainder);
		}
		//Append basic part to array
		for(j=0;j<i;j++){
			s[j + __uriBase.length] = reversed[i-1-j];
		}
		return string(s);
		//maps an address to an array which records all token ID owned by an array element
		mapping(address => uint[])internal ownerTokenIndexes;
		//maps each TokenID to its position of owner TokenIndexes
		mapping(uint => uint)internal token TokenIndexes;
	
		constructor(uint _initialSupply) public TokenERC721 {
			for(uint i = 0; i < _initialSupply; i++) {
			tokenTokenIndexes[i+1]=i;
			ownerTokenIndexes[creator].push(i+1);
			TokenIndexes.push(i+1);
			indexTokens[i + 1]=i;
			}
			//add to ERC165 Interface Check
			supportedInterfaces[
			this.totalSupply.selector^
			this.TokenByIndex.selector^
			this.tokenOfOwnerByIndex.selector
			]=true;
		}
		//function tokensupply returns the length of TokenIndexes
		//since all token is saved in array TokenIndexes, length of the array is the number of tokens
	function totalSupply() external view returns(uint256) {
	return TokenIndexes.length;
	}
	//keeps the position of tokens in an array, we need to check its range before using it
	function TokenByIndex(uint256 _index) external view returns(uint256){
		require(_index < TokenIndexes.length);
		return tokenIndexes[_index];
	}
	//checks index value and returns position of tokens in ownerTokenIndexes array
	function tokenOfOwnerByIndex(address _owner, uint256 _index) external view returns(uint256) {
		require(_index < balances[_owner][_index];)
	}
	//burning tokens --similar to transferFrom The only difference is that we need to remove the token from tokenIndexes when we add it to ownerTokenIndexes[_to]
	function burnToken(uint256 _tokenId) external {
		address owner = ownerOf(_tokenId);
		require(owner == msg.sender  || allowance[_tokenId] == msg.sender || authorised[owner][msg.sender]);
		burned[_tokenId] = true;
		balances[owner]--;
		emit Transfer(owner, 0x0, _tokenId);
		//===enumerable Additions
		uint oldIndex = tokenTokenIndexes[_tokenId];
		if(oldIndex != ownerTokenIndexes[_tokenId];
			//move the last token to the old position
			ownerTokenIndexes[owner][oldIndex] = 
				ownerTokenIndexes[owner][ownerTokenIndexes][owner].length-1]
			//change the tokens reference to new one
			tokenTokenIndexes[owner].length--;
			delete tokenTokenIndexes[_tokenId];
			//This part deals with tokenIndexes
			oldIndex = indexTokens[_tokenId];
			if(oldIndex != tokenIndexes.length -1) {
			//move last token to old position
			tokenIndexes[oldIndex] = tokenIndexes[tokenIndexes.length -1];
			}
			tokenIndexes.length--;
			)
			//issue tokens function @dev it must always follow the standard no matter the logic
			uint newId = maxId.add(1);//Using SafeMath to prevemt overflows
			//Append index of new Token to ownerTokenIndexes
			tokenTokenIndexes[newId] = ownerTokenIndexes[msg.sender],length;
			//append tokenId to ownerTokenIndexes
			ownerTokenIndexes[creator].push(newId);
			//append token to tokenIndexes
			indexTokens[thisId] = tokenIndexes.length;
			tokenIndexes.push(thisId);
			for newId 1/4 maxId + 1, //make sure assigning newId after all the new coin creation process is over

				function issueTokens(uint256 _extraTokens) public {
				require(msg.sender == creator);
				balances[msg.sender] = balances[msg.sender].add(_extraTokens);
				uint thisId;//reuse this for each iteration below
				for(uint i = 0; i < _extraTokens; i++) {
				thisId = maxId.add(i).add(1);//SafeMath to be safe

				}
				}
	}






































	}

}
