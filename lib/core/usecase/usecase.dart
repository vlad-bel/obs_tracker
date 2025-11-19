abstract interface class UseCase<T, P>{
  Future<T>call(P p);
}

class NoParams{
  const NoParams();
}

