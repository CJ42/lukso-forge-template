// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "../src/MyProfile.sol";

contract MyProfileTest is Test {
    UniversalProfile myUniversalProfile;

    function setUp() public {
        myUniversalProfile = new MyProfile();
    }

    function testCanSetData() public {
        bytes32 someKey = keccak256("some key");
        bytes memory someValue = hex"cafecafe";

        myUniversalProfile.setData(someKey, someValue);
    }

    function testCanSetDataGivenAsParams(bytes32 _dataKey, bytes memory _dataValue) public {
         myUniversalProfile.setData(_dataKey, _dataValue);
    }

    function testSetDataAsNotOwner() public {
        vm.expectRevert("Ownable: caller is not the owner");
        vm.prank(address(0));
        bytes32 someKey = keccak256("some key");
        bytes memory someValue = hex"cafecafe";

        myUniversalProfile.setData(someKey, someValue);
    }

    function testCanReceiveEther(uint96 amount) public {
        payable(address(myUniversalProfile)).transfer(amount);
    }
}

contract NumberTest is Test {
    uint256 testNumber;
    
    function setUp() public {
        testNumber = 42;
    }

    function testNumberIs42() public {
        assertEq(testNumber, 42);
    }

    function testFailSubtract43() public {
        testNumber -= 43;
        // assertEq(testNumber - 43, 0);
    }

    function testCannotSubtract43() public {
        vm.expectRevert(stdError.arithmeticError);
        testNumber -= 43;
    }
}