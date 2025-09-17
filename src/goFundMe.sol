// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

contract goFundMe {
    uint256 public amount;
    address public owner;
    address public latestFunder;
    address [] public Funders;
    mapping (address => uint256) public FundersToAmt;
    // FUNDME
    
    function fundMe() public payable {
        owner = msg.sender;
        // use payable keyword whenever you are sending real ether
        // It allows you to send money from an address to a contract.
        // msg.sender this is the caller/address calling a particular transaction
        // msg.value tells you how much in wei, gwei or ether you're spending to execute

        // TODO
        // take nothing less than 0.2 ether
        require(msg.value > 0.2 ether, "you cant be in this goFundMe");
        amount = msg.value;

        // mapping updating the amount per value of the funders
        FundersToAmt [msg.sender] = FundersToAmt [msg.sender] + msg.value;
       

        Funders.push (msg.sender);

         // Get latest funder
         latestFunder = msg.sender;
    }


    // WITHDRAWFROMME
    //TO SEND MONEY FROM YOUR CONTRACT TO ADDRESS, YOU NEED THESE 3 KEYWORDS...CALL,SEND & TRANSFER

    function withdrawToMe(uint256 _amount) public {
        require(owner == msg.sender, "you are not the owner of this contract");
        
        require(_amount < amount, "you didn't put that much sir");
        (bool _success,) = payable (msg.sender).call{value: _amount}("");
        require(_success == true, "pls revert");

    }

      function getAmountInAddress() public view returns (uint256) {
            return msg.sender.balance;
        }


}