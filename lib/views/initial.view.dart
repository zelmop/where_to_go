import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/utils/utils.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class InitialView extends StatefulWidget {
  const InitialView({super.key});

  @override
  State<InitialView> createState() => _InitialViewState();
}

class _InitialViewState extends State<InitialView> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _emailTextEditingController;
  late TextEditingController _passwordTextEditingController;

  @override
  void initState() {
    _emailTextEditingController = TextEditingController();
    _passwordTextEditingController = TextEditingController();
    
    super.initState();
  }

  @override
  void dispose() {
    _emailTextEditingController.dispose();
    _passwordTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<InitialViewViewModel>.reactive(
      viewModelBuilder: () => InitialViewViewModel(),
      builder: (context, viewModel, child) => SafeArea(
        child: Scaffold(
          body: Container(
            color: ColorConstants.primaryGrey,
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GapsContants.extraLargeVerticalGap,
                  Image(
                    image:  const AssetImage('assets/images/where_to_go_logo.png'),
                    width: size.width *.8,
                  ),
                  GapsContants.extraLargeVerticalGap,
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      children: [
                        BasicInput(
                          controller: _emailTextEditingController, 
                          labelText: 'Email', 
                          width: size.width * .7,
                          validator: TextFormFieldValidators.validateEmail
                        ),
                        GapsContants.largeVerticalGap,
                        BasicInput(
                          controller: _passwordTextEditingController, 
                          labelText: 'Contraseña', 
                          width: size.width * .7,
                          obscureText: true,
                          validator: TextFormFieldValidators.validatePassword
                        ),
                        GapsContants.largeVerticalGap,
                        LargeButton(
                          color: ColorConstants.primaryColor, 
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await viewModel.onNavigateToHomeView();
                            }
                          }, 
                          text: 'INGRESAR', 
                          width: size.width * .7
                        ),
                        GapsContants.largeVerticalGap,
                      ]
                    )
                  )
                ]
              )
            )
          )
        )
      )
    );
  }
}