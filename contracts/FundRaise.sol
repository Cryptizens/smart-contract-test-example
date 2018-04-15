pragma solidity ^0.4.21;

contract FundRaise {
  address public owner;
  bool public paused;

  modifier OnlyByOwner() {
    require(msg.sender == owner);
    _;
  }

  modifier OnlyWhenUnpaused() {
    require(!paused);
    _;
  }

  // @dev constructor function. Sets contract owner
  function FundRaise() public {
    owner = msg.sender;
  }

  function pause() public OnlyByOwner {
    paused = true;
  }

  function unpause() public OnlyByOwner {
    paused = false;
  }

  function () payable public OnlyWhenUnpaused { }

  function removeFunds() public {
    owner.transfer(address(this).balance);
  }
}
