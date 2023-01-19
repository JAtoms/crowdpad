import 'package:crowdpad/dependency/cubit/auth_cubit/auth_cubit.dart';
import 'package:crowdpad/dependency/get_it.dart';

import 'dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'dependency/cubit/profile_cubit/profile_cubit.dart';
import 'dependency/get_it_service_exports.dart';
import 'dependency/navigation/global_router.dart';
import 'dependency/navigation/global_router_exports.dart';
import 'index_exports.dart';

class Index extends StatefulWidget {
  const Index({Key? key}) : super(key: key);

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  late ProfileCubit _profileCubit;
  late DashboardCubit _dashboardCubit;
  late AuthCubit _authCubit;

  @override
  void initState() {
    _profileCubit = getItInstance<ProfileCubit>();
    _dashboardCubit = getItInstance<DashboardCubit>();
    _authCubit = getItInstance<AuthCubit>();

    super.initState();
  }

  @override
  void dispose() {
    _profileCubit.close();
    _dashboardCubit.close();
    _authCubit.close();
    super.dispose();
  }

  String initialRoute() => Routes.signUpScreen;

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
                BlocProvider.value(value: _profileCubit),
                BlocProvider.value(value: _dashboardCubit),
                BlocProvider.value(value: _authCubit),
              ],
              child: MaterialApp(
                title: 'CrowdPad',
                theme:
                    ThemeData(primarySwatch: GlobalColors.materialPrimaryColor),

                // theme: ThemeData.dark()
                //     .copyWith(primaryColor: GlobalColors.materialPrimaryColor),

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
