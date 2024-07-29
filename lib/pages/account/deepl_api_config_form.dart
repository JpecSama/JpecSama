import 'package:flutter/material.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/main.dart';
import 'package:jpec_sama/repositories/user_cred_repository.dart';

class DeeplApiConfigForm extends StatefulWidget {
  const DeeplApiConfigForm({
    super.key,
  });

  @override
  State<DeeplApiConfigForm> createState() => _DeeplApiConfigFormState();
}

class _DeeplApiConfigFormState extends State<DeeplApiConfigForm> {
  final TextEditingController _apiKeyTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kPadding,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: kPadding * 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                "DeepL Api Key",
                style: context.textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextFormField(
                controller: _apiKeyTextController,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ElevatedButton(
                onPressed: () async {
                  String? userId = supabase.auth.currentUser?.id;
                  if (userId == null) {
                    context.showSnackBar("You must be authenticated.",
                        isError: true);
                    return;
                  }
                  UserCredRepository repo = UserCredRepository();
                  // TODO Validate key
                  await repo.setDeeplApiKey(
                    userId,
                    _apiKeyTextController.text.trim(),
                  );
                  context
                      .showSnackBar(context.translations.successfullyUpdated);
                },
                child: Text('Save'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
