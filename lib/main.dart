import 'package:dimplom/firebase_options.dart';
import 'package:dimplom/model/course/course_viewmodel.dart';
import 'package:dimplom/screens/screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'model/auth/auth_viewmodel.dart';
import 'model/profile/profile_viewmodel.dart';
import 'model/wishlist/wishlist_viewmodel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CourseViewModel()),
        ChangeNotifierProvider(create: (_) => WishlistViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Edutiv',
        theme: ThemeData(
          primaryColor: const Color(0xFF126E64),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
            ),
          ),
          checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          fontFamily: 'Poppins',
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Color(0xFF126E64),
          ),
        ),
        builder: EasyLoading.init(),
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/forgetPassword': (context) => const ForgetPasswordScreen(),
          '/confirmPasswordReset': (context) =>
              const ConfirmPasswordResetScreen(),
          '/passwordReset': (context) => const PasswordResetScreen(),
          '/passwordResetSuccess': (context) =>
              const PasswordResetSuccessScreen(),
          '/mainpage': (context) => MainPage(),
          '/homeScreen': (context) => const HomeScreen(),
          '/courseScreen': (context) => const CourseScreen(),
          '/myCourse': (context) => const MyCourseScreen(),
          '/detailCourse': (context) => const DetailCourseScreen(),
          '/learningCourse': (context) => const LearningCourseScreen(),
          '/successCourse': (context) => const SuccessCourseScreen(),
          '/profile': (context) => const ProfileScreen(),
          '/editProfile': (context) => const EditProfileScreen(),
          '/faq': (context) => const FAQScreen(),
          '/formRequest': (context) => const FormRequestScreen(),
          '/certificate': (context) => const CertificateScreen(),
          '/certificateDetail': (context) => const CertificateDetailScreen(),
          '/dataReport': (context) => const DataReportScreen(),
          '/search': (context) => const SearchScreen(),
        },
      ),
    );
  }
}
