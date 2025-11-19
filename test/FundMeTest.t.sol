//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundme;

    function setUp() external {
        //fundme = new FundMe(); // FundMe needs an address for the price feed as an argument
        DeployFundMe deployFundMe = new DeployFundMe();
        fundme = deployFundMe.run();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundme.MINIMUM_USD(), 5 * 10 ** 18);
    }

    function testOwnerIsMsgSender() public view {

        assertEq(fundme.i_owner(), address(this));
    }

    function testPriceFeedVersionIsCorrect() public view {
        uint256 version = fundme.getVersion();
        assertEq(version, 4);
    }
}