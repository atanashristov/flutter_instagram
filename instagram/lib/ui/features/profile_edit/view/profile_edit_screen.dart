import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:instagram/app/l10n/l10n.dart';
import 'package:instagram/domain/entities/user.dart';
import 'package:instagram/domain/repositories/user_repository.dart';
import 'package:instagram/domain/use_cases/update_user/update_user.dart';
import 'package:instagram/domain/use_cases/upload_profile_image/upload_profile_image.dart';
import 'package:instagram/shared/helpers/helpers.dart';
import 'package:instagram/ui/constants/constants.dart';
import 'package:instagram/ui/features/profile/bloc/profile_bloc.dart';
import 'package:instagram/ui/features/profile_edit/cubit/profile_edit_cubit.dart';
import 'package:instagram/ui/widgets/avatars/avatars.dart';
import 'package:instagram/ui/widgets/buttons/buttons.dart';
import 'package:instagram/ui/widgets/dialogs/dialogs.dart';

class ProfileEditScreenArgs {
  const ProfileEditScreenArgs({required this.context});

  final BuildContext context;
}

class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({required this.user, super.key});

  static const String routeName = '/profile_edit';

  static Route<dynamic> route({
    required ProfileEditScreenArgs args,
  }) =>
      MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (context) => BlocProvider<ProfileEditCubit>(
          create: (_) => ProfileEditCubit(
            updateUser: UpdateUser(userRepository: context.read<UserRepository>()),
            uploadProfileImage: UploadProfileImage(),
            profileBloc: args.context.read<ProfileBloc>(),
            // profileBloc: context.read<ProfileBloc>(), // this context does not know where the bloc is!
          ),
          child: ProfileEditScreen(user: args.context.read<ProfileBloc>().state.user),
        ),
      );

  // Form key needed for validations
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.profileEditScreenTitle),
        ),
        body: BlocConsumer<ProfileEditCubit, ProfileEditState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              Navigator.of(context).pop();
            } else if (state.status.isError) {
              ErrorDialog.showFailure(context, failure: state.failure);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (state.status.isSubmitting) const LinearProgressIndicator(),
                  kGapVXXL,
                  GestureDetector(
                    onTap: () => _selectProfileImage(context),
                    child: Center(
                      child: UserProfileAvatar(
                        radius: 80,
                        profileImageUrl: user.profileImageUrl,
                        profileImage: state.profileImage,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(kSizeXL),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            initialValue: user.username,
                            decoration: InputDecoration(hintText: context.l10n.usernameFieldHintText),
                            onChanged: (value) => context.read<ProfileEditCubit>().usernameChanged(value),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(6),
                            ]),
                          ),
                          kGapVM,
                          TextFormField(
                            initialValue: user.bio,
                            decoration: InputDecoration(hintText: context.l10n.bioFieldHintText),
                            onChanged: (value) => context.read<ProfileEditCubit>().bioChanged(value),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(),
                              FormBuilderValidators.minLength(20),
                            ]),
                          ),
                          kGapVM,
                          PrimaryButton(
                            context.l10n.updateButtonText,
                            onPressed: () => _submitForm(context, state.status.isSubmitting),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _selectProfileImage(BuildContext context) async {
    final pickedFile = await ImageHelper.pickImageFromGalery(
      toolbarColor: Theme.of(context).primaryColor,
      cropStyle: CropStyle.circle,
      title: context.l10n.profileImageTitle,
    );
    if (pickedFile != null) {
      context.read<ProfileEditCubit>().profileImageChanged(File(pickedFile.path));
    }
  }

  void _submitForm(BuildContext context, bool isSubmitting) {
    if ((_formKey.currentState?.validate() ?? false) && !isSubmitting) {
      context.read<ProfileEditCubit>().submit();
    }
  }
}
