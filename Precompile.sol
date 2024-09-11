import {sha512_256, Sapphire} from "./Sapphire.sol";

contract Demo {
  constructor() {
    Sapphire.generateSigningKeyPair(Sapphire.SigningAlg.Secp256k1PrehashedKeccak256, Sapphire.randomBytes(32, ""));
  }
}
