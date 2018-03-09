pragma solidity ^0.4.0;
contract calc
{
    function add(uint a,uint b) public view returns(uint)
    {
        return (a+b);
    }
     function sub(uint a,uint b) public view returns(uint)
    {
        return (a-b);
    }
     function mul(uint a,uint b) public view returns(uint)
    {
        return (a*b);
    }
     function div(uint a,uint b) public view returns(uint)
    {
        return (a/b);
    }
}
