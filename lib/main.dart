import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:restoapp/restoapp/screens/home_screen.dart';
import 'package:restoapp/restoapp/screens/logopage.dart';
import 'package:restoapp/restoapp/screens/payment.dart';
import 'package:restoapp/restoapp/screens/shopping_info_screen.dart';
import 'package:restoapp/restoapp/screens/splash_screen1.dart';

import 'cubit/home_cubit.dart';
import 'cubit/shopping_info_cubit.dart';
import 'dio/dio_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'hive/boxes.dart';

void main() async {
  DioHelper.init();
  await Hive.initFlutter();
  await Hive.openBox(infoBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers:
        [
        BlocProvider(
        create: (context) => HomeCubit()..showLoading(),
        ),
        BlocProvider(
        create: (context) => ShoppingInfoCubit()..showLoading(),
        ),

        ],
        child: BlocProvider(
      create: (context) => HomeCubit()..showLoading(),
      child: GetMaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale('en'),
        debugShowCheckedModeBanner: false,
        home: LogoScreen(),
      ),
        )
    );
  }
}

