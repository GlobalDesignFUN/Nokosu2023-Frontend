
// ignore: file_names
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nokosu2023/Components/SubComponents/neumorphism.dart';
import 'package:nokosu2023/Screens/home.dart';

import 'package:nokosu2023/Screens/evaluate_check_screen.dart';
import 'package:nokosu2023/providers/form_err_res_provider.dart';
import 'package:nokosu2023/providers/group_provider.dart';
import 'package:nokosu2023/providers/home_state.dart';
import 'package:nokosu2023/providers/info_provider.dart';
import 'package:nokosu2023/providers/locale_provider.dart';
import 'package:nokosu2023/providers/profile_provider.dart';
import 'package:nokosu2023/providers/token_provider.dart';
import 'package:nokosu2023/utils/constants.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class Nokosu extends StatelessWidget {
  const Nokosu({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<ApiResults> res;
  @override
  void initState() {
    super.initState();
    res = fetchApiResults();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => FormErrProvider()),
        ChangeNotifierProvider(create: (context) => TokenProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => GroupProvider()),
        ChangeNotifierProvider(create: (context) => GroupsProvider()),
        ChangeNotifierProvider(create: (context) => InfoProvider()),
        ChangeNotifierProvider(create: (context) => InfosProvider()),
        ChangeNotifierProvider(create: (context) => HomeStateProvider()),
      ],
      builder: (context, state) {
        int id = Provider.of<TokenProvider>(context, listen: false).id;
        return MaterialApp(
          title: 'Nokosu',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Provider.of<LocaleProvider>(context).locale,
          home: const HomePage(),
        );
      },
    );
  }
}

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColours.bgBlueWhite,
      body: Center(
        child: SizedBox(
          height: 140,
          width: 140,
          child: Neumo(
            child: SvgPicture.asset(
              CustIcons.logo,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class ApiResults {
  final String token;
  final String profile;

  ApiResults({
    required this.token,
    required this.profile,
  });
  factory ApiResults.fromJson(Map<String, dynamic> json) {

    return ApiResults(
      token: json['token'],
      profile: json['profile'],
    );
  }
    @override
  String toString() {
    return 'ApiResults(token: $token)';
  }
}

Future<ApiResults> fetchApiResults() async {
  //ログインapiのurlをＵＲｉ　の型にする
  var url = Uri.parse("https://globaldesign2023backend.onrender.com/api/users/login/");
  //SampleRequestで、送るデータの型を決める
  //型に合わせて実際に送るデータを決める
  var request = SampleRequest(username: "yoshiki", password: 'ewrjioiojio234');
  //データを送る
  //successしたとき　responseにデータが入る
  //failureしたとき　エラーメッセージが入る
  final response = await http.post(url,
      body: json.encode(request.toJson()),
      headers: {"Content-Type": "application/json",
      "User-Agent":"PostmanRuntime/7.34.0",
      'Accept': 'application/json',
      });
  if (response.statusCode == 200) {
    return ApiResults.fromJson(json.decode(response.body));
    
  } else {
    throw Exception('Failed');
  }
}
class SampleRequest {
  String username;
  String password;
  SampleRequest({
    required this.username,
    required this.password,
  });
  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}