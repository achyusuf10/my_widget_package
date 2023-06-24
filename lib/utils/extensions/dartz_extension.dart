part of 'extension.dart';

extension EitherX<L, R> on Either<L, R> {
  R asRight() => (this as Right).value;
  L asLeft() => (this as Left).value;
}

extension TaskX<T extends Either<Object, dynamic>> on Task<T> {
  Task<Either<B, A>> mapLeft<B, A>() {
    return map<Either<B, A>>((Either<Object, dynamic> either) =>
        either.fold<Either<B, A>>((Object obj) {
          try {
            return Left<B, A>(obj as B);
          } catch (e) {
            throw obj;
          }
        }, (dynamic u) {
          try {
            return Right<B, A>(u as A);
          } catch (e) {
            throw u;
          }
        }));
  }
}
