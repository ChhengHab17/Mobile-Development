import 'package:first_app/w12/ui/classrooms/classrooms.dart';
import 'package:first_app/w12/ui/home.dart';
import 'package:first_app/w12/ui/students/students.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state){
        return const Home();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'classroom',
          builder: (context, state){
            return const Classrooms();
          },
        ),
        GoRoute(
          path: 'student',
          builder: (context, state){
            return const Students();
          },
        )
      ],
    )
  ]
);