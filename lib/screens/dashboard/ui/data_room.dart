import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machineglow/core/viewmodels/view_models.dart';
import 'package:machineglow/screens/dashboard/ui/result.dart';
import 'package:machineglow/shared/resources/resources.dart';
import 'package:machineglow/shared/widgets/glow_button.dart';
import 'package:machineglow/shared/widgets/header_texts.dart';
import 'package:machineglow/shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

class DataRoom extends StatefulWidget {
  static const String routeName = '/description';
  const DataRoom({super.key});

  @override
  State<DataRoom> createState() => _DataRoomState();
}

class _DataRoomState extends State<DataRoom> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _houseAddress = TextEditingController();
  final TextEditingController _taxPayable = TextEditingController();
  final int _roomNo = 1;
  int taxPayable = 1000;
  @override
  Widget build(BuildContext context) {
    final glowthemeData = Provider.of<GlowThemeViewModel>(context);
    return Consumer<DashboardViewmodel>(builder: (context, viewmodel, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: kprimaryColor),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GlowThemeHeaderText(
                  title: 'Data room',
                  description: 'Please filter the right location',
                ),
                VerticalSpacing(50.h),
                DescriptionWidget(
                  title: 'Select zone',
                  widget: GlowDropDownButton(
                      glowThemeData: glowthemeData,
                      items: viewmodel.zones,
                      hintText: 'Zone A'),
                ),
                VerticalSpacing((screenpadding)),
                DescriptionWidget(
                  title: 'Select LGA',
                  widget: GlowDropDownButton(
                      glowThemeData: glowthemeData,
                      items: viewmodel.zoneToShow,
                      hintText: 'lga'),
                ),
                VerticalSpacing((screenpadding)),
                DescriptionWidget(
                  title: 'Select street',
                  widget: GlowDropDownButton(
                      glowThemeData: glowthemeData,
                      multiList: const ['Tanke', 'Oke-odo', 'Sanrab'],
                      hintText: 'street'),
                ),
                VerticalSpacing((screenpadding)),
                DescriptionWidget(
                  title: 'House Number',
                  widget: TextFieldWidget(
                      controller: null,
                      obscureText: false,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number,
                      validator: (s) => UtilsHelpers.validateRequiredFields(s,
                          label: 'House Number'),
                      onTap: () {},
                      hintText: '1'),
                ),
                VerticalSpacing((screenpadding)),
                TextFieldWidget(
                  hintText: "House Address",
                  textInputAction: TextInputAction.done,
                  obscureText: false,
                  controller: _houseAddress,
                  textInputType: TextInputType.text,
                  validator: (String? val) =>
                      UtilsHelpers.validateRequiredFields(val!.trim(),
                          label: 'House'),
                ),
                VerticalSpacing((verticalPadding)),
                SizedBox(
                  width: double.infinity,
                  child: GlowButton(
                    loading: viewmodel.loading,
                    text: 'Show Result',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ShowResultScreen()));
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class AddOrMinusWidget extends StatelessWidget {
  const AddOrMinusWidget({
    Key? key,
    this.onTap,
    required this.icon,
  }) : super(key: key);
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: (horizontalPadding..sp),
          ),
          decoration: BoxDecoration(
            color: kprimaryColorLight,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: kColorBlack,
          )),
    );
  }
}

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final glowthemeData = Provider.of<GlowThemeViewModel>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: glowthemeData.textTheme().bodyLarge,
        ),
        SizedBox(width: size.width * 0.55, child: widget),
      ],
    );
  }
}

class GlowDropDownButton extends StatefulWidget {
  const GlowDropDownButton({
    Key? key,
    required this.glowThemeData,
    this.items,
    required this.hintText,
    this.multiList,
  }) : super(key: key);
  final GlowThemeViewModel glowThemeData;
  final List? items;
  final List? multiList;

  final String hintText;

  @override
  State<GlowDropDownButton> createState() => _GlowDropDownButtonState();
}

class _GlowDropDownButtonState extends State<GlowDropDownButton> {
  String? selectedValue;
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardViewmodel>(builder: (context, viewmodel, child) {
      return GestureDetector(
        onTap: () {
          selected = !selected;

          setState(() {});
        },
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: (horizontalPadding..sp),
          ),
          decoration: BoxDecoration(
              color: kprimaryColorLight,
              borderRadius: BorderRadius.circular(textFieldBorderRadius),
              border: Border.all(
                  color: selected ? kprimaryColor : kprimaryColorLight)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: Text(
                  widget.hintText,
                  style: widget.glowThemeData.textTheme().bodyMedium,
                ),
                items: widget.items != null
                    ? widget.items!
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style:
                                    widget.glowThemeData.textTheme().bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList()
                    : widget.multiList!
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style:
                                    widget.glowThemeData.textTheme().bodyLarge,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                value: selectedValue,
                onChanged: (str) {
                  setState(() {
                    selectedValue = str as String;
                    viewmodel.setZoneList();
                  });
                }),
          ),
        ),
      );
    });
  }
}
