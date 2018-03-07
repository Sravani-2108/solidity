pragma solidity ^0.4.0;
contract shopping
{
     uint endtime=now+50 days;
    struct product
    {
        uint256 id;
        uint256 count;
        uint256 price;
    }
    struct cust
    {
        uint256 countt;
        uint256 cid;
        uint256[] prod;
        uint256 total;
       
    }
    
    mapping(uint256=>product)p;
    mapping(uint256=>cust)c;
    
    function addprod(uint256 _id,uint256 _count,uint256 _price) public
    {
        p[_id].id=_id;
        p[_id].count=_count;
        p[_id].price=_price;
    }
 
    function getprod(uint256 _cid,uint256 _id,uint256 countt) public  
    {
        
        c[_cid].countt=countt;
        require(p[_id].count > c[_cid].countt);
        c[_cid].total=p[_id].price*c[_cid].countt;
        p[_id].count=p[_id].count-c[_cid].countt;
        c[_cid].prod.push(p[_id].id);
   }
     function retprod(uint256 _cid) public constant returns(uint256,uint256,uint256[])
   {
       return(c[_cid].countt,c[_cid].total, c[_cid].prod);
   }
    function search(uint256 _id) public view returns(string){
        if(p[_id].count>0){
            return "product is avilable";
        }
        else{
            return "product is not avilable";
        }
    }
        
    function avail(uint256 _id)public constant returns(uint256)
    {
        return( p[_id].count);  
    }
}
