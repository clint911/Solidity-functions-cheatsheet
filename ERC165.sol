contract CheckERC165 is ERC165 {
	mapping(bytes4 => bool) internal supportedInterfaces;
	//supportedInterfaces function returns a value from mapping variable
	function supportsInterface(bytes4 internalID) external view returns (bool) {
	return supportedInterfaces[interfaceID];
	}
	//iniatializing our contract constructor
	constructor() public { supportedInterfaces[this.supportsInterface.selector] = true;
	}

}
