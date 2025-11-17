//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundme;

    function setUp() external {
        fundme = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306); // FundMe needs an address for the price feed as an argument
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundme.MINIMUM_USD(), 5 * 10 ** 18);
    }

    function testOwnerIsMsgSender() public view {
        console.log("Owner is: ", fundme.getOwner());
        console.log("Msg sender is: ", msg.sender);
        assertEq(fundme.getOwner(), address(this));
    }
}