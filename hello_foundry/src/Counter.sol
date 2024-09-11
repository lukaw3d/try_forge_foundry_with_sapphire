// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import {sha512_256, Sapphire} from "./Sapphire.sol";

contract Counter {
    uint256 public number;

    constructor() {
        bytes memory sk = Sapphire.randomBytes(32, "");
        bytes memory keypair = Sapphire.generateSigningKeyPair(Sapphire.SigningAlg.Secp256k1PrehashedKeccak256, sk);
        (bytes memory a, bytes memory b) = abi.decode(keypair, (bytes, bytes));
        bytes memory seed = hex"0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef";
        bytes memory publicKey;
        bytes memory privateKey;
        publicKey = Sapphire.generateSigningKeyPair(Sapphire.SigningAlg.Ed25519Pure, seed);
        // revert("a");
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
