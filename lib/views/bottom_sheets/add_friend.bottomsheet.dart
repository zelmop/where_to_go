import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ui_components/ui_components.dart';
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
        builder: (context) => 
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GapsContants.mediumVerticalGap,
                BasicInput(
                  controller: _nameTextEditingController, 
                  labelText: 'Nombre', 
                  width: size.width * .7,
                  obscureText: false
                ),
                GapsContants.mediumVerticalGap,
                BasicInput(
                  controller: _nickTextEditingController, 
                  labelText: 'Apodo', 
                  width: size.width * .7,
                  obscureText: false
                ),
                GapsContants.mediumVerticalGap,
                SufixInput(
                  controller: _preferenceTextEditingController, 
                  labelText: 'Agregar preferencia', 
                  width: size.width * .7,
                  obscureText: false,
                  onPressed: () {
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
                    itemBuilder: (context, index) => Chip(
                      onDeleted: () {},
                      elevation: 2,
                      label: Text(
                        viewModel.preferences[index]
                      ),
                      deleteIcon: const Icon(Icons.close, size: 16)
                    )
                  )
                ),
                GapsContants.mediumVerticalGap,
                TextButton(
                  onPressed: () async => await viewModel.onGetLocation(),
                  child: const Text('establecer ubicación')
                ),
                GapsContants.mediumVerticalGap,
                LargeButton(
                  color: ColorConstants.primaryColor, 
                  onPressed: () {}, 
                  text: 'AGREGAR', 
                  width: size.width * .7
                )
              ]
            )
          ),
        )
      )
    );
  }
}