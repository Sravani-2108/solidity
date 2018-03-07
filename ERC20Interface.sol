pragma solidity ^0.4.0;

interface ERC20Interface{
    function balanceOf(address tokenOwner) public constant returns (uint);
    function allowance(address tokenOwner, address spender) public constant returns (uint);
    function transfer(address to, uint amount) public returns (bool);
    function approve(address spender, uint amount) public returns (bool);
    function transferFrom(address tokenOwner,address spender,uint amount) public returns(bool);
    function deposit(uint amount) public returns (bool);
    function withdraw(uint amount) public returns (bool);
    
    event Transfer(address from, address to, uint amount);
    event Approval(address tokenOwner, address spender, uint amount);
}
