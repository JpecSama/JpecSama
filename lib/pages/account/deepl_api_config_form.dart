import 'package:flutter/material.dart';
import 'package:jpec_sama/constants.dart';
import 'package:jpec_sama/extensions/context_extension.dart';
import 'package:jpec_sama/services/supabase/repositories/user_cred_repository.dart';
import 'package:jpec_sama/services/supabase/supabase_service.dart';

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
  final UserCredRepository _userCredRepo = UserCredRepository();
  bool _isVisible = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final userId = supabase.auth.currentSession!.user.id;
      _apiKeyTextController.text =
          (await _userCredRepo.getDeeplApiKey(userId)) ?? '';
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: kPadding,
        horizontal: kPadding,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: kPadding * 2,
        horizontal: kPadding,
      ),
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(8)),
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
                obscureText: !_isVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: _isVisible
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                  ),
                ),
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
