import 'package:crowdpad/dependency/cubit/dashboard_cubit/dashboard_cubit.dart';
import 'package:crowdpad/index_exports.dart';
import 'package:crowdpad/ui/global_components/bottom_nav_widget.dart';

final isVisible = ValueNotifier(true);

class Domain extends StatefulWidget {
  const Domain({Key? key}) : super(key: key);

  @override
  State<Domain> createState() => _DomainState();
}

class _DomainState extends State<Domain> {
  Widget bottomPages({required int index}) {
    final bottomPages = [
      const HomePage(),
      const HomePage(),
      const HomePage(),
      const HomePage()
    ];
    return index < 3 ? bottomPages[index] : bottomPages[0];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, dashboardState) {
      return WillPopScope(
        onWillPop: () async => false,
        child: ValueListenableBuilder(
            valueListenable: pagePosition,
            builder: (context, index, child) {
              return Scaffold(
                  backgroundColor: Colors.white,
                  resizeToAvoidBottomInset: false,
                  body: Stack(
                    children: [
                      bottomPages(index: index),
                      const Align(
                          alignment: Alignment.bottomCenter,
                          child: BottomNavigation()),
                    ],
                  ));
            }),
      );
    });
  }
}
