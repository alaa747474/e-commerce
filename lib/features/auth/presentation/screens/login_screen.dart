
import 'package:e_commerce_app/features/products/presentaion/screens/product_screen.dart';
import 'package:e_commerce_app/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState>_formKey=GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Welcome Back to Shop App',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Hellp there,sign in to continue!',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 35,
                ),
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state is LogedIn) {
                      Navigator.pushReplacementNamed(
                          context, ProductsScreen.routeName,arguments: _userNameController.text);
                    }
                  },
                  builder: (context, state) {
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 25),
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomTextFormField(
                            hintText: 'User Name',
                            icon: Icons.email_rounded,
                            obscureText: false,
                            controller: _userNameController,
                            validator: (userName) {
                              if (userName==null||userName.isEmpty) {
                                return 'Invalid Username';
                              }
                              return null;
                            },
                            onChanged: null,
                          ),
                          CustomTextFormField(
                            obscureText: context.read<LoginCubit>().isShowen,
                            hintText: 'Password',
                            icon: Icons.lock_rounded,
                            suffixIcon: InkWell(
                              onTap: (){
                                context.read<LoginCubit>().showPassword();
                              },
                              child: Icon(Icons.remove_red_eye,color: Theme.of(context).hintColor,)),
                            controller: _passwordController,
                            validator: (password) {
                              if (password==null||password.isEmpty) {
                                return 'Invalid Password';
                              }
                               if (password.length<5) {
                                return 'Password Should be more than 7';
                               }
                              return null;
                            },
                            onChanged: null,
                          ),
                          CustomButton(
                            onPressed: () {
                              _formKey.currentState!.validate();
                              context.read<LoginCubit>().login(
                                  loginModel: LoginModel(
                                      userName: _userNameController.text,
                                      password: _passwordController.text),
                                  context: context);
                              
                            },
                            text: 'Login',
                          )
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Don't have an account?",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
