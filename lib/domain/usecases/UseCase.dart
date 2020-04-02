abstract class UseCase<T, Params> {
  Future<Stream<T>> buildUseCaseStream(Params params);

  void execute(Params params) {
    buildUseCaseStream(params);
  }
}
