part of auth_card;

class _UserIdLoginCard extends StatefulWidget {
  _UserIdLoginCard(
      {Key? key,
      required this.userIdValidator,
      required this.onSwitchLogin,
      required this.userType,
      this.loginTheme,
      required this.navigateBack})
      : super(key: key);

  final FormFieldValidator<String>? userIdValidator;
  final Function onSwitchLogin;
  final LoginUserType userType;
  final LoginTheme? loginTheme;
  final bool navigateBack;

  @override
  _UserIdLoginCardState createState() => _UserIdLoginCardState();
}

class _UserIdLoginCardState extends State<_UserIdLoginCard>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formUserIdLoginKey = GlobalKey();

  TextEditingController? _nameController;

  var _isSubmitting = false;

  AnimationController? _submitController;

  @override
  void initState() {
    super.initState();

    final auth = Provider.of<Auth>(context, listen: false);
    _nameController = TextEditingController(text: auth.userID);

    _submitController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  }

  @override
  void dispose() {
    _submitController!.dispose();
    super.dispose();
  }

  Future<bool> _submit() async { 
    if (!_formUserIdLoginKey.currentState!.validate()) {
      return false;
    }
    final auth = Provider.of<Auth>(context, listen: false);
    final messages = Provider.of<LoginMessages>(context, listen: false);

    _formUserIdLoginKey.currentState!.save();
    await _submitController!.forward();
    setState(() => _isSubmitting = true);
    final error = await auth.onUserIdLogin!(auth.userID);
    if (error == 'alsu50lirayı'){ //* bura recover değil id ile giriş için
      return true;
    }
    if (error != null ) {
      showErrorToast(context, messages.flushbarTitleError, error);
      setState(() => _isSubmitting = false);
      await _submitController!.reverse();
      return false;
    } else {
      showSuccessToast(context, messages.flushbarTitleSuccess,
          messages.userIdLoginButtonSuccess);
    setState(() => _isSubmitting = false);
    await _submitController!.reverse();
    if (widget.navigateBack) widget.onSwitchLogin();
    return true;
    }
  }

  Widget _buildUserIdLoginNameField(
      double width, LoginMessages messages, Auth auth) {
    return AnimatedTextFormField(
      controller: _nameController,
      width: width,
      labelText: messages.userIdLoginHint,
      prefixIcon: Icon(FontAwesomeIcons.solidUserCircle),
      keyboardType: TextFieldUtils.getKeyboardType(widget.userType),
      autofillHints: [TextFieldUtils.getAutofillHints(widget.userType)],
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (value) => _submit(),
      validator: widget.userIdValidator,
      onSaved: (value) => auth.userID = value!,
    );
  }

  Widget _buildUserIdLoginButton(ThemeData theme, LoginMessages messages) {
    return AnimatedButton(
      controller: _submitController,
      text: messages.userIdLoginButton,
      onPressed: !_isSubmitting ? _submit : null,
    );
  }

  Widget _buildBackButton(
      ThemeData theme, LoginMessages messages, LoginTheme? loginTheme) {
    final calculatedTextColor =
        (theme.cardTheme.color!.computeLuminance() < 0.5)
            ? Colors.white
            : theme.primaryColor;
    return MaterialButton(
      onPressed: !_isSubmitting
          ? () {
              _formUserIdLoginKey.currentState!.save();
              widget.onSwitchLogin();
            }
          : null,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      //TODO orjinali bu ama login theme gelmiyor
      textColor: loginTheme?.switchAuthTextColor ?? calculatedTextColor,
      // textColor: loginTheme?.switchAuthTextColor ?? Colors.lightBlue,
      child: Text(messages.goBackButton),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final auth = Provider.of<Auth>(context, listen: false);
    final messages = Provider.of<LoginMessages>(context, listen: false);
    final deviceSize = MediaQuery.of(context).size;
    final cardWidth = min(deviceSize.width * 0.75, 360.0);
    const cardPadding = 16.0;
    final textFieldWidth = cardWidth - cardPadding * 2;

    return FittedBox(
      child: Card(
        child: Container(
          padding: const EdgeInsets.only(
            left: cardPadding,
            top: cardPadding + 10.0,
            right: cardPadding,
            bottom: cardPadding,
          ),
          width: cardWidth,
          alignment: Alignment.center,
          child: Form(
            key: _formUserIdLoginKey,
            child: Column(
              children: [
                Text(
                  messages.userIdLoginButtonIntro,
                  key: kUserIdLoginIntroKey,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 20),
                _buildUserIdLoginNameField(textFieldWidth, messages, auth),
                SizedBox(height: 20),
                Text(
                  messages.userIdLoginButtonDescription,
                  key: kUserIdLoginDescriptionKey,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyText2,
                ),
                SizedBox(height: 26),
                _buildUserIdLoginButton(theme, messages),
                _buildBackButton(theme, messages, widget.loginTheme),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
