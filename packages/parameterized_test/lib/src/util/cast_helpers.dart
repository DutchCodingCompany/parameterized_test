import '../errors/parameter_type_error.dart';

R cast<R, S>(S value) {
  try {
    return value as R;
  } on TypeError catch (e, _) {
    throw ParameterTypeError(R, value.runtimeType);
  }
}

R castElementAt<R>(Iterable values, int index) => cast(values.elementAt(index));
