part of 'shopping_info_cubit.dart';

@immutable
abstract class ShoppingInfoState {}

class ShoppingInfoInitial extends ShoppingInfoState {}
class ShoppingLoadingState extends ShoppingInfoState {}
class ShoppingSuccessState extends ShoppingInfoState {}
class ShoppingEmptyState extends ShoppingInfoState {}

