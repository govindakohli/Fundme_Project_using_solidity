// // SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test, console} from "../lib/forge-std/src/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";



contract FundMeTest is Test {
    FundMe fundMe;
    address constant MAINNET_ETH_USD_FEED =
        0x694AA1769357215DE4FAC081bf1f309aDC325306; // Chainlink ETH/USD feed
    uint256 constant SEND_VALUE = 0.1 ETH // 100000000000000000
    function setUp() public {
        fundMe = new FundMe(MAINNET_ETH_USD_FEED); // ✅ Ensure this address is valid
    }

    function testPriceFeedVersionIsAccurate() public {
        uint256 version = fundMe.getVersion();
        assertEq(version, 4); // Expected Chainlink version
    }

    function testFailsWithoutEnoughETH() public {
        vm.expectRevert();
        fundMe.fund();
    }

    function testFundUpdatesFundedDataStructure() public {
        vm.prank(USER) ;
        fundMe.fund{value:SEND_VALUE}();

        uint256 amountFunded = fundMe.getAdd
    }
}
