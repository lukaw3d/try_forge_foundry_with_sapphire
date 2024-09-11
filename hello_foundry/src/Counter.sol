// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {sha512_256, Sapphire} from "./Sapphire.sol";

contract Counter {
    uint256 public number;

    constructor() {
        bytes memory sk = Sapphire.randomBytes(32, "");
        revert(string(sk));
        // Sapphire.generateSigningKeyPair(Sapphire.SigningAlg.Secp256k1PrehashedKeccak256, sk);
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
