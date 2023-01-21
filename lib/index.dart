import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok_flutter/dependency/get_it.dart';
import 'package:tiktok_flutter/helpers/colors.dart';

import 'dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'dependency/cubit/upload_cubit/upload_cubit.dart';
import 'dependency/get_it_service_exports.dart';
import 'dependency/navigation/global_router.dart';
import 'dependency/navigation/global_router_exports.dart';
import 'helpers/size_config.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late UploadVideoCubit _uploadVideoCubit;
  late DashboardCubit _dashboardCubit;

  @override
  void initState() {
    _uploadVideoCubit = getItInstance<UploadVideoCubit>();
    _dashboardCubit = getItInstance<DashboardCubit>();

    super.initState();
  }

  @override
  void dispose() {
    _uploadVideoCubit.close();
    _dashboardCubit.close();

    super.dispose();
  }

  String initialRoute() => Routes.domain;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MultiBlocProvider(
              providers: [
                BlocProvider.value(value: _uploadVideoCubit),
                BlocProvider.value(value: _dashboardCubit),
              ],
              child: MaterialApp(
                title: 'CrowdPad',
                debugShowCheckedModeBanner: false,
                theme:
                    ThemeData(primarySwatch: GlobalColors.materialPrimaryColor),
                navigatorKey:
                    getItInstance<NavigationServiceImpl>().navigationKey,
                initialRoute: initialRoute(),
                onGenerateRoute: (value) => GlobalRouter.generateRoutes(value),
              ),
            );
          });
        }));
  }
}
