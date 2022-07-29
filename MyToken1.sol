//setting token supply via constructor
contract MyToken {
    function MyToken(uint _setSupply) {
        totalSupply_ = _setSupply/// @title A title that should describe the contract/interface
        /// @author The name of the author
        /// @notice Explain to an end user what this does
        /// @dev Explain to a developer any extra details

    }
    //maintaining a variable token supply via minting
    function mint(address _to, uint256 _amount) onlyOwner canMint public returns(bool) {
        totalSupply_ = totalSupply_.add(_amount);
        balances[_to] = balances[_to].add(_amount);
        Mint(_to, _amount);
        Transfer(address(0), _to, _amount);
        return true;
    }

}