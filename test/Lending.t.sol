// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Lending} from "../src/Lending.sol";

contract LendingTest is Test {
    Lending public lending;

    address weth = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1;
    address usdc = 0xaf88d065e77c8cC2239327C5EDb3A432268e5831;

    function setUp() public {
        vm.createSelectFork("https://arb-mainnet.g.alchemy.com/v2/2hMC-guBxy1qlHFc8mi5i314PUIOSbrT", 335104487);
        lending = new Lending();
    }

    function test_supplyAndBorrow() public {
        deal(weth, address(this), 1e18);
        IERC20(weth).approve(address(lending), 1e18);

        lending.supplyAndBorrow(1e18, 1e6);
        console.log("USDC balance after borrowing: ", IERC20(usdc).balanceOf(address(this)));
    }
}
