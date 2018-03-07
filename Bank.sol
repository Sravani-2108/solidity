pragma solidity ^0.4.0;
import "./ERC20Interface.sol";
contract ERC20 is ERC20Interface
{
    string public symbol;
    string public name;
    uint public decimals;
    uint public totalSupply;
    address owner;
    mapping(address=>uint) balances;
    mapping(address => mapping(address => uint)) alowed;
    
    function ERC20()public payable
    {
        owner=msg.sender;
        symbol="BS";
        name="Sra";
        decimals=0;
        totalSupply=6000;
        balances[owner]=totalSupply;
        
    }
    
    modifier onlyOwner(){
        if(msg.sender!=owner){
            revert();
        }
        _;
    }
    function balanceOf(address tokenOwner) public constant returns (uint) 
    {
        return balances[tokenOwner];
    }
    function transfer(address to, uint amount) public returns (bool)
    {
        require(msg.sender!=to && amount>0);
        balances[msg.sender] = balances[msg.sender] - amount;
        balances[to] = balances[to] + amount;
        Transfer(msg.sender,to,amount);
        return true;
    }
     function approve(address spender, uint amount) public returns (bool)
     {
        require(msg.sender != spender && amount>0);
        alowed[msg.sender][spender] = amount;
        Approval(msg.sender,spender,amount);
        return true;
    }
    function allowance(address tokenOwner, address spender) public constant returns (uint)
    {
        require(tokenOwner != spender);
        return alowed[tokenOwner][spender];
    }
    function transferFrom(address tokenOwner,address to,uint amount) public returns(bool)
    {
         if (balances[tokenOwner] >= amount && amount > 0 && alowed[tokenOwner][to] >= amount)
         {
             balances[tokenOwner] -= amount;
             balances[to] += amount;
             alowed[tokenOwner][to] -= amount;
             return true;
         }
         else
         {
             return false;
         }
     }
    
    function withdraw(uint amount) public returns(bool)
    {
     require(amount<= balances[msg.sender] && amount>0);
     balances[msg.sender]=balances[msg.sender] - amount;
     return true;
    }
    function deposit(uint amount) public returns(bool)
    {
        require(amount>0);
        balances[msg.sender]=balances[msg.sender] + amount;
        return true;
    }
}
