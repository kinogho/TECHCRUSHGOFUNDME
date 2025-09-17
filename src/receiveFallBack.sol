// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract receiveFallBack{
    address public owner;

    function deposit () public payable {
        payable (msg.sender).transfer(msg.value);
        // (bool _success,) = (msg.sender).send (msg.value)


    }
    
    
    // receive and fallback are special keywords in solidity used to receive ethers from other addresses.
}
