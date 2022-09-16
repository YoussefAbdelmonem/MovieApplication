import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_application/core/error/failure.dart';

/// CALLABLE CLASS
abstract class BaseUseCase<Type, Parameters>
{
  Future <Either<Failure,Type>> call(Parameters parameters);
}

class NoParameters extends Equatable
{
  const NoParameters();
  @override

  List<Object?> get props => [];

}