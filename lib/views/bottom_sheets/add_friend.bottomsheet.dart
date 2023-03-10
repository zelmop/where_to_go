import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/utils/utils.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class AddFriendBottomSheet extends StatefulWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  
  const AddFriendBottomSheet({
    super.key,
    required this.request,
    required this.completer
  });

  @override
  State<AddFriendBottomSheet> createState() => _AddFriendBottomSheetState();
}

class _AddFriendBottomSheetState extends State<AddFriendBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _preferencesFormKey = GlobalKey<FormState>();

  late ScrollController _scrollController;

  late TextEditingController _nameTextEditingController;
  late TextEditingController _nickTextEditingController;
  late TextEditingController _preferenceTextEditingController;

  @override
  void initState() {
    _scrollController = ScrollController();

    _nameTextEditingController = TextEditingController();
    _nickTextEditingController = TextEditingController();
    _preferenceTextEditingController = TextEditingController();

    super.initState();
  }
  
  @override
  void dispose() {
    _scrollController.dispose();

    _nameTextEditingController.dispose();
    _nickTextEditingController.dispose();
    _preferenceTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<AddFriendBottomSheetViewModel>.reactive(
      viewModelBuilder: () => AddFriendBottomSheetViewModel(), 
      builder: (context, viewModel, child) => 
      BottomSheet(
        enableDrag: false,
        onClosing: () {},
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))
        ),
        builder: (context) => 
        SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    GapsContants.mediumVerticalGap,
                    BasicInput(
                      controller: _nameTextEditingController, 
                      labelText: 'Nombre', 
                      width: size.width * .7,
                      obscureText: false,
                      validator: TextFormFieldValidators.valdiateName
                    ),
                    GapsContants.mediumVerticalGap,
                    BasicInput(
                      controller: _nickTextEditingController, 
                      labelText: 'Apodo', 
                      width: size.width * .7,
                      obscureText: false,
                      validator: TextFormFieldValidators.valdiateNick
                    )
                  ]
                )
              ),
              Form(
                key: _preferencesFormKey,
                autovalidateMode: AutovalidateMode.always,
                child: Column(
                  children: [
                    GapsContants.mediumVerticalGap,
                    SufixInput(
                      controller: _preferenceTextEditingController, 
                      labelText: 'Agregar preferencia', 
                      width: size.width * .7,
                      obscureText: false,
                      validator: TextFormFieldValidators.validatePreference,
                      onPressed: () {
                        if (!_preferencesFormKey.currentState!.validate()) {
                          return;
                        }
                        viewModel.onAddPreference(_preferenceTextEditingController.text);
                        _preferenceTextEditingController.text = '';
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      icon: Icons.add_outlined
                    ),
                    GapsContants.mediumVerticalGap,
                    SizedBox(
                      width: size.width * .7,
                      height: 40,
                      child: ListView.separated(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: viewModel.preferences.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                        itemBuilder: (context, index) => ChipCommon(
                          onDeleted: () => viewModel.onDeletePreference(index),
                          text: viewModel.preferences[index]
                        )
                      )
                    )
                  ]
                )
              ),
              GapsContants.mediumVerticalGap,
              TextButton(
                onPressed: () async => await viewModel.onGetLocation(),
                child: const Text('establecer ubicaci??n')
              ),
              GapsContants.mediumVerticalGap,
              LargeButton(
                color: ColorConstants.primaryColor, 
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    viewModel.onAddFriend(
                      name: _nameTextEditingController.text, 
                      nick: _nickTextEditingController.text
                    );
                  }
                }, 
                text: 'AGREGAR', 
                width: size.width * .7
              )
            ]
          )
        )
      )
    );
  }
}