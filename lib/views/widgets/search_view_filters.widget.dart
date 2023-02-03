import 'package:flutter/material.dart';
import 'package:ui_components/ui_components.dart';
import 'package:where_to_go/utils/utils.dart';

class SearchViewFilters extends StatefulWidget {
  final VoidCallback onShowFilter;
  final VoidCallback onTogleFilters;
  final bool toggleFilters;
  final bool showFilters;
  final double radius;

  const SearchViewFilters({
    super.key,
    required this.onShowFilter,
    required this.onTogleFilters,
    required this.toggleFilters,
    required this.showFilters,
    required this.radius
  });

  @override
  State<SearchViewFilters> createState() => _SearchViewFiltersState();
}

class _SearchViewFiltersState extends State<SearchViewFilters> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _radiusTextEditingController;

  @override
  void initState() {
    _radiusTextEditingController = TextEditingController(text: '${widget.radius}');

    super.initState();
  }

  @override
  void dispose() {
    _radiusTextEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AnimatedContainer(
      onEnd: widget.onShowFilter,
      width: size.width * .9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorConstants.primaryGrey
      ),
      height: widget.toggleFilters ? size.height * .2 : 40,
      duration: const Duration(milliseconds: 100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => widget.onTogleFilters(),
                  child: const Icon(Icons.tune_outlined)
                )
              ]
            )
          ),
          if (widget.showFilters)
            _getFilters(size)
        ]
      )
    );
  }

  Widget _getFilters(Size size) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          BasicInput(
            controller: _radiusTextEditingController, 
            labelText: 'Radio de busqueda en metros', 
            width: size.width * .8,
            validator: TextFormFieldValidators.validateRaius
          )
        ]
      )
    );
  }
}