// SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";

contract Bank{
    using Address for address payable;

    mapping(address => uint) public balanceOf;

    // deposit ether funds
    function deposit() external payable{
        balanceOf[msg.sender] += msg.value;
    }

    // withdraw ether funds
    function withdraw() external{
        uint depositedAmount = balanceOf[msg.sender];
        payable(msg.sender).sendValue(depositedAmount);
        balanceOf[msg.sender] = 0;
    }

}