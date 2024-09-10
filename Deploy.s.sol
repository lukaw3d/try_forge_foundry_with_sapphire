contract Demo is Script {
  function run() external {
    vm.startBroadcast();
    new SimpleDemo(msg.sender);
    vm.stopBroadcast();
  }
}
