import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_challenge/edit_product_page/item_controller/item_controller.dart';
import 'package:flutter_challenge/edit_product_page/widgets/dropdown_type_selector.dart';
import 'package:flutter_challenge/edit_product_page/widgets/rating_editor_widget.dart';
import 'package:flutter_challenge/edit_product_page/widgets/text_field_widget.dart';
import 'package:flutter_challenge/shared/models/item_model.dart';
import 'package:flutter_challenge/shared/widgets/send_form_appbar_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EditProductPage extends StatelessWidget {
  final ItemModel item;
  const EditProductPage({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ItemController(item);
    const double spacing = 20;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Observer(
              builder: (_) => SendFormAppBarWidget(
                  context: context,
                  isValid: controller.isFormValid,
                  submit: controller.submitForm))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/${controller.filename}'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: spacing,
              ),
              Observer(
                  builder: (_) => TextFieldWidget(
                      initialValue: controller.title,
                      errorText: controller.validateName,
                      onChanged: controller.changeTitle,
                      label: 'Name')),
              SizedBox(
                height: spacing,
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                    maxLines: 5,
                    initialValue: controller.title,
                    onChanged: controller.changeDescription,
                    label: 'Description'),
              ),
              SizedBox(
                height: spacing,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Observer(
                      builder: (_) => TextFormField(
                        inputFormatters: [],
                        initialValue: controller.price,
                        onChanged: controller.changePrice,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Price",
                          errorText: controller.validatePrice == null
                              ? null
                              : controller.validatePrice(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: spacing / 2,
                  ),
                  Expanded(
                      child: DropdownTypeSelectorWidget(
                          type: controller.type.typeParse)),
                ],
              ),
              SizedBox(
                height: spacing,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [RatingEditorWidget(controller)])
            ],
          ),
        ),
      ),
    );
  }
}
