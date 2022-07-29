//ERC721 tokens must solve the following problems
//ownership--processing ownership of a token contract
//creation--how to create token contract
//transfer&authorization --how to transfer tokens and how to approve other addresses to be able to transfer our tokens
//destroy--how to destroy the token

pragma solidity ^0.8.4;
contract ERC721{
    function addTokenTo(address _to, uint256  _tokenid) internal {
        super.addTokenTo(_to, _tokenid);
        uint256 length = ownedTokens[_to].length;
        ownedTokens[_to].push(_tokenid);
        ownedTokensIndex[_tokenid] = length;
    }
    //call this function in ERC721BasicToken.sol
    function addTokenTo(address _to, uint256 _tokenid) internal {
        require(tokenOwner[_tokenid] == address(0));
        tokenOwner[_tokenid] = _to;
        ownedTokensCount[_to] = ownedTokensCount[_to].add(1);
    }

    function _mint(address _to, uint256 _tokenid) internal {
        super._mint(_to, _tokenid);
        allTokensIndex[_tokenid] = allTokens.length;
        allTokens.push(_tokenid);
    }
    function _mint(address _to, uint256 _tokenId) internal {
        require(_to != address(0));
        addTokenTo(_to, _tokenId);
        Transfer(address(0), _to, _tokenId);
    }

    //give a string to URI data by looking up a mapping froma token ID to a string
    //optional mapping for token URI
    mapping(uint256 => string) internal tokenURIs;

    function _setTokenURI(uint256 _tokenId, string _uri) {
        //ensuring tokenid exists before assigning data
        require(exists(_tokenId));
        tokenURIs[_tokenId] = uri;
    }
    function exists(uint256 _tokenId) public view returns(bool) {
        address owner = tokenOwner[_tokenId];
        return owner != address(0);
    }
    //the global variable
    mapping(address => mapping(address => uint256)) internal allowed
    //allowance of another address to spend your tokens
    function approve(address _spender, uint256 _value) public returns (bool) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        require(_to != address(0));
        require(_value <= allowed[_from][msg.sender]);
        require(_value <= allowed[_from][msg.sender]);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        Transfer(_from, _to, _value);
        return true;
    }

    //approval of an address for transferring by tokenID and to transfer the tokenID. tokenApprovals is a global variable which maps a tokenID or an index to an address. If approved, the addresss is able to transfer a specific token by it ID
    mapping(uint256 => address) internal tokenApprovals;
    function getApproved(uint256 _tokenId) public view returns (address) {
        return tokenApprovals[_tokenId];
    }

    @dev //FULL ERC721 TOKEN IMPLE,MENTATION
    function removeTokenFrom(address _from, uint256 _tokenId) internal {
        super.removeTokenFrom(address _from, uint256 _tokenId);
        uint256 tokenIndex = ownedTokensIndex[_tokenId];
        uint256 lastTokenIndex = ownedTokens[_from].length.sub(1);
        uint256 lastToken = ownedTokens[_from][lastTokenIndex];
        ownedTokens[_from][tokenIndex] = lastToken;
        ownedTokens[_from][lastTokenIndex] = 0;
        ownedTokens[_from].length--;
        ownedTokensIndex[_tokenId] = 0;
        ownedTokensIndex[lastToken] = tokenIndex;
    }

    //Basic ERC721 implementation
    function removeTokenFrom(address _from, uint256 _tokenId) internal {
        require(ownerOf(_tokenId) == _from);
        ownedTokensCount[_from] = ownedTokensCount[_from].sub(1);
        takenOwner[_tokenId] = address(0);
    } 
    (pg101)
}
