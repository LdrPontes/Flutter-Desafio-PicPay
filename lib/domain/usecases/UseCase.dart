abstract class UseCase<T, Params> {
  Stream<T> buildUseCaseStream(Params params);

  void execute(Params params) {
    buildUseCaseStream(params);
  }
}
