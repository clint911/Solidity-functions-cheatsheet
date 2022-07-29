contract MyContract {
    function burn(uint256 _value) public {
	require(_value <= balances[msg.sender]);
	address burner = msg.sender;
	//balance in the burner is what is left in the senders address
	balances burner = msg.sender;
	totalSupply_ = totalSupply_.sub(_value);
	Burn(burner, _value);
	Transfer(burner, address(0),_value);
	}
	//burning an erc721 token
    function _burn(address _owner, uint256 _tokenId)internal {
	super._burn(_owner,_tokenId);
	//destroying the metadata if any
	if(bytes(tokenURIs[_tokenId]).length != 0) {
	delete tokenURIs[_tokenId];	
	}
	//re-org all tokens array
	uint256 tokenIndex = allTokensIndex[_tokenId];
	uint256 lastTokenIndex = allTokens.length.sub(1);
	uint256 lastToken = allTokens[lastTokenIndex];
	allTokens[tokenIndex] = lastToken;
	allTokens[lastTokenIndex] = 0;
	allTokens.length--;
	allTokensIndex[_tokenId] = 0;
	allTokensIndex[lastToken] = tokenIndex;
    }
	}
   function _burn(address _owner, uint256 _tokenId) internal {
   clearApproval(_owner, _tokenId);
   removeTokenFrom(_owner, _tokenId);
   Transfer(_owner, address(0),_tokenId);
   }


}
