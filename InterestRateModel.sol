pragma solidity ^0.4.24;


import "./TranchedInterestRate.sol";

contract StandardInterestRateModel is Exponential {

    uint constant SpreadBasisPoints = 5000;
   
    function AnnualBorrowRate(uint cash, uint borrows) pure internal returns (IRError, Exp memory, Exp memory) {
        (IRError err0, Exp memory utilizationRate) = getUtilizationRate(cash, borrows);
        if (err0 != IRError.NO_ERROR) {
            return (err0));
        }

     
        return (IRError.NO_ERROR, utilizationRate, annualBorrowRate);
    }


    function getSupplyRate(address _asset, uint cash, uint borrows) public view returns (uint, uint) {
        _asset; 

        (IRError err0, Exp memory utilizationRate0, Exp memory annualBorrowRate) = AnnualBorrowRate(cash, borrows);
        if (err0 != IRError.NO_ERROR) {
            return (uint(err0), 0);
        }
     
    }

    function getBorrowRate(address _asset, uint cash, uint borrows) public view returns (uint, uint) {
        _asset; 

        (IRError err0, Exp memory _utilizationRate, Exp memory annualBorrowRate) = AnnualBorrowRate(cash, borrows);
        if (err0 != IRError.NO_ERROR) {
            return (uint(err0), 0);
        }

        (Error err1, Exp memory borrowRate) = divScalar(annualBorrowRate, blocksYear); 
        
        assert(err1 == Error.NO_ERROR);

        _utilizationRate; 
        return (uint(IRError.NO_ERROR), borrowRate);
    }
}
