import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/screens/products_search_screen/products_search_screen.dart';
import 'package:internship_project_1/shared/colors.dart';

class SearchBarWidget extends StatefulWidget {
  final ValueChanged<String> onChangeValue;
  final VoidCallback onEditingComplete;
  final hasCancel;
  const SearchBarWidget({
    this.onChangeValue,
    this.onEditingComplete,
    this.hasCancel = false,
    Key key,
  }) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController _controller;
  bool _hasDeleteIcon = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  Widget buildTextField() {
    return TextField(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProductsSearchScreen()),
        );
      },
      controller: _controller,
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      maxLines: 1,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundGray, width: 0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: backgroundGray, width: 0),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        fillColor: backgroundGray,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Icon(
            Icons.search,
            color: systemGray,
          ),
        ),
        prefixIconConstraints: BoxConstraints(
          minWidth: 25.0,
          minHeight: 18.0,
        ),
        hintText: S.of(context).search,
        hintStyle: TextStyle(color: systemGray),
        suffixIcon: Container(
          padding: EdgeInsetsDirectional.only(
            start: 2.0,
            end: _hasDeleteIcon ? 0.0 : 0,
          ),
          child: _hasDeleteIcon
              ? InkWell(
                  onTap: (() {
                    setState(() {
                      WidgetsBinding.instance
                          .addPostFrameCallback((_) => _controller.clear());
                      _hasDeleteIcon = false;
                    });
                  }),
                  child: Icon(
                    Icons.cancel,
                    size: 16.0,
                    color: systemGray,
                  ),
                )
              : Text(''),
        ),
      ),
      onChanged: (value) {
        setState(() {
          if (value.isEmpty) {
            _hasDeleteIcon = false;
          } else {
            _hasDeleteIcon = true;
          }
          widget.onChangeValue(_controller.text);
        });
      },
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(FocusNode());
        widget.onEditingComplete();
      },
      style: TextStyle(fontSize: 16.0, color: systemGray),
    );
  }

  Widget onlyTextField(double size) {
    return Container(
      height: 40.0,
      width: MediaQuery.of(context).size.width * size,
      child: buildTextField(),
    );
  }

  Widget cancelTextField(double size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        onlyTextField(size),
        TextButton(
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Text(
            S.of(context).cancel,
            style: TextStyle(
                color: orange, fontSize: 14.0, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// Padding values cannot be passed to the function cobertPx2Dpx
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 25.0),
      child: widget.hasCancel ? cancelTextField(0.68) : onlyTextField(1),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
