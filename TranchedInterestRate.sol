pragma solidity ^0.4.24;


contract InterestRateModel {

 
    function getSupplyRate(address asset, uint cash, uint borrows) public view returns (uint, uint);


    function getBorrowRate(address asset, uint cash, uint borrows) public view returns (uint, uint);
}