class LoadingService {
  bool isLoading = false;

  active() {
    isLoading = true;
  }

  deactive() {
    isLoading = false;
  }
}
