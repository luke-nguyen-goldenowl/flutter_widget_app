class OTPState {
  int start;
  bool error;

  OTPState({
    this.start = 10,
    this.error = false,
  });

  void conntDown() {
    start--;
  }

  void refresh() {
    start = 10;
  }
}
