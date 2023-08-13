import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../hive/hive_helper.dart';

part 'shopping_info_state.dart';

class ShoppingInfoCubit extends Cubit<ShoppingInfoState> {
  ShoppingInfoCubit() : super(ShoppingInfoInitial());

  void getInfo() async{
    emit(ShoppingLoadingState());
    await HiveHelper.getInfo();

    if(HiveHelper.infoList.isEmpty){
      emit(ShoppingEmptyState());
    }
    else{
      emit(ShoppingSuccessState());
    }
  }
  void addNote(String title) {
    HiveHelper.addToList(title);
    emit(ShoppingSuccessState());
  }
  void removeNote(int index) {
    HiveHelper.removeFromList(index);
    if (HiveHelper.infoList.isEmpty) {
      emit(ShoppingEmptyState());
    }
    else {
      emit(ShoppingSuccessState());
    }
  }
  void showLoading()async{
    emit(ShoppingLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(ShoppingSuccessState());
  }
}
