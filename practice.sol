// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

//Hello world
    contract HelloWorld {
        string public greet = "Hello World";
    }

//simple application
    contract Counter{
       uint public count;
       //function to get curent count
       function get () public view returns (uint256){
        return count;
}
        //function to increment count by 1
        function inc() public {
            count +=1;
        }
        //function to decrement count by 1
        function dec() public {
            count -=1;
        }

//Primitive data types
    //uint stands for unassigned interger(non negative)
    uint256 public u256 = 456;
    //use int when interger is negative
    int128 public i= -22;
    
      // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}


contract Variables {
    // State variables are stored on the blockchain.
    string public text = "Hello";
    uint256 public num = 123;

    function doSomething() public {
        // Local variables are not saved to the blockchain.
        uint256 i = 456;

        // Here are some global variables
        uint256 timestamp = block.timestamp; // Current block timestamp
        address sender = msg.sender; // address of the caller
        
    }
}



