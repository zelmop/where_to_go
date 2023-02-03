import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/utils/utils.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class AddPaymentItemDialog extends StatefulWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  
  const AddPaymentItemDialog({
    super.key,
    required this.request,
    required this.completer
  });

  @override
  State<AddPaymentItemDialog> createState() => _AddPaymentItemDialogState();
}

class _AddPaymentItemDialogState extends State<AddPaymentItemDialog> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _nameTextEditingController;
  late TextEditingController _priceTextEditingController;

  @override
  void initState() {
    _nameTextEditingController = TextEditingController();
    _priceTextEditingController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _nameTextEditingController.dispose();
    _priceTextEditingController.dispose();

    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    
    return ViewModelBuilder<AddPaymentItemDailogViewModel>.reactive(
      viewModelBuilder: () => AddPaymentItemDailogViewModel(widget.request.data), 
      builder: (context, viewModel, child) => Dialog(
        insetPadding: const EdgeInsets.all(8),
        child: SizedBox(
          width: size.width * .9,
          height: size.height * .4,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: size.width * .9,
                height: size.height * .4,
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Header(
                        color: ColorConstants.primaryColor, 
                        fontStyle: FontStyle.normal, 
                        fontWeight: FontWeight.w700, 
                        text: 'Agregar item', 
                        width: size.width
                      ),
                      GapsContants.smallVerticalGap,
                      BasicInput(
                        controller: _nameTextEditingController, 
                        labelText: 'Producto/Servicio', 
                        width: size.width * .7,
                        validator: TextFormFieldValidators.valdiateName
                      ),
                      GapsContants.smallVerticalGap,
                      BasicInput(
                        controller: _priceTextEditingController, 
                        labelText: 'Precio', 
                        width: size.width * .7,
                        validator: TextFormFieldValidators.validatePaymentPrice
                      ),
                      GapsContants.smallVerticalGap,
                      LargeButton(
                        color: ColorConstants.primaryColor, 
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          viewModel.onAddPaymentItem(
                            _nameTextEditingController.text, 
                            _priceTextEditingController.text
                          );
                        }, 
                        text: 'AGREGAR', 
                        width: size.width * .7
                      )
                    ]
                  )
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                  ),
                  margin: const EdgeInsets.only(top: 15, right: 15),
                  child: GestureDetector(
                    onTap: () => viewModel.onCompleteDialogUnconfirmed(),
                    child: const Icon(Icons.close_outlined)
                  )
                )
              )
            ]
          )
        )
      )
    );
  }
}