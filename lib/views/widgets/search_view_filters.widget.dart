import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/utils/utils.dart';
import 'package:where_to_go/viewmodels/viewmodels.dart';

class SearchViewFilters extends StatefulWidget {
  final List<Friend> friends;
  final VoidCallback onShowFilter;
  final VoidCallback onTogleFilters;
  final VoidCallback applyFilters;
  final int radius;
  final bool showFilters;
  final bool toggleFilters;
  final TextEditingController radiusTextEditingController;
  final TextEditingController preferencesTextEditingController;
  
  const SearchViewFilters({
    super.key,
    required this.friends,
    required this.onShowFilter,
    required this.onTogleFilters,
    required this.applyFilters,
    required this.radius,
    required this.showFilters,
    required this.radiusTextEditingController,
    required this.preferencesTextEditingController,
    required this.toggleFilters
  });

  @override
  State<SearchViewFilters> createState() => _SearchViewFiltersState();
}

class _SearchViewFiltersState extends State<SearchViewFilters> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return ViewModelBuilder<SearchViewFiltersWidgetViewModel>.reactive(
      viewModelBuilder: () => SearchViewFiltersWidgetViewModel(),
      onViewModelReady: (viewModel) {
        viewModel.initialize(widget.friends);
        widget.preferencesTextEditingController.text = viewModel.preferences.join(" ");
        widget.radiusTextEditingController.text = '${widget.radius}';
      },
      builder: (context, viewModel, child) => AnimatedContainer(
        onEnd: widget.onShowFilter,
        width: size.width * .9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white
        ),
        height: widget.toggleFilters ? viewModel.preferences.isNotEmpty ? size.height * .4 : size.height * .25 : 60,
        duration: const Duration(milliseconds: 100),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Filtros'),
                  GestureDetector(
                    onTap: () {
                      widget.onTogleFilters();
                      viewModel.initialize(widget.friends);
                    },
                    child: Icon(
                      Icons.tune_outlined,
                      color: widget.showFilters ? ColorConstants.primaryColor : Colors.black,
                    )
                  )
                ]
              )
            ),
            GapsContants.smallVerticalGap,
            if (widget.showFilters)
              _getFilters(size, viewModel)
          ]
        )
      )
    );
  }

  Widget _getFilters(Size size, SearchViewFiltersWidgetViewModel viewModel) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          BasicInput(
            controller: widget.radiusTextEditingController, 
            labelText: 'Radio de busqueda en metros', 
            width: size.width * .8,
            validator: TextFormFieldValidators.validateRadius
          ),
          GapsContants.smallVerticalGap,
          viewModel.preferences.isNotEmpty ? SizedBox(
            width: size.width * .8,
            height: size.height * .1,
            child: SingleChildScrollView(
              child: Wrap(
                children: [
                  ...viewModel.preferences.map((e) {
                    return ChipCommon(
                      onDeleted: () {
                        viewModel.onDeletePreference(e);
                        widget.preferencesTextEditingController.text = viewModel.preferences.join(" ");
                      },
                      text: e
                    );
                  })
                ]
              )
            )
          ) : Container(),
          GapsContants.smallVerticalGap,
          LargeButton(
            color: ColorConstants.primaryColor, 
            onPressed: widget.applyFilters, 
            text: 'APLICAR', 
            width: size.width * .7
          )
        ]
      )
    );
  }
}