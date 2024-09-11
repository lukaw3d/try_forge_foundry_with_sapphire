// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";
import {Sapphire} from "../src/Sapphire.sol";

contract RANDOM_BYTES_MOCK {
    function jIUTh(bytes calldata) external view returns (bytes memory) {
        bytes memory output = "1bcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabcdabc1";
        return output;
    }
}
contract GENERATE_SIGNING_KEYPAIR_MOCK {
    function jIUTh(bytes calldata) external view returns (bytes memory) {
        bytes memory output = abi.encode(bytes("abc"), bytes("def"));
        return output;
    }
}


contract CounterScript is Script {
    // Oasis-specific, confidential precompiles
    address internal constant RANDOM_BYTES =
        0x0100000000000000000000000000000000000001;
    address internal constant DERIVE_KEY =
        0x0100000000000000000000000000000000000002;
    address internal constant ENCRYPT =
        0x0100000000000000000000000000000000000003;
    address internal constant DECRYPT =
        0x0100000000000000000000000000000000000004;
    address internal constant GENERATE_SIGNING_KEYPAIR =
        0x0100000000000000000000000000000000000005;
    address internal constant SIGN_DIGEST =
        0x0100000000000000000000000000000000000006;
    address internal constant VERIFY_DIGEST =
        0x0100000000000000000000000000000000000007;
    address internal constant CURVE25519_PUBLIC_KEY =
        0x0100000000000000000000000000000000000008;
    address internal constant GAS_USED =
        0x0100000000000000000000000000000000000009;
    address internal constant PAD_GAS =
        0x010000000000000000000000000000000000000a;

    // Oasis-specific, general precompiles
    address internal constant SHA512_256 =
        0x0100000000000000000000000000000000000101;
    address internal constant SHA512 =
        0x0100000000000000000000000000000000000102;
    address internal constant SHA384 =
        0x0100000000000000000000000000000000000104;

    Counter public counter;

    function setUp() public {
        RANDOM_BYTES_MOCK mock1 = new RANDOM_BYTES_MOCK();
        vm.etch(RANDOM_BYTES, address(mock1).code);

        GENERATE_SIGNING_KEYPAIR_MOCK mock2 = new GENERATE_SIGNING_KEYPAIR_MOCK();
        vm.etch(GENERATE_SIGNING_KEYPAIR, address(mock2).code);
    }

    function run() public {
        vm.startBroadcast();

        counter = new Counter();

        vm.stopBroadcast();
    }
}
