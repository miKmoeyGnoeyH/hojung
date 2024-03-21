
import 'package:flutter/material.dart';

class RegisterSendEmailSection extends StatefulWidget {
  const RegisterSendEmailSection({
    super.key,
    required this.emailEditingController,
    required this.labelPadding,
    required this.heightOfSizedBoxBetweenLabelAndField,
    required this.heightOfSizedBoxBetweenSubSection,
  });

  final TextEditingController emailEditingController;
  final double labelPadding;
  final double heightOfSizedBoxBetweenLabelAndField;
  final double heightOfSizedBoxBetweenSubSection;

  @override
  State<RegisterSendEmailSection> createState() =>
      _RegisterSendEmailSectionState();
}

class _RegisterSendEmailSectionState extends State<RegisterSendEmailSection> {
  // TODO
  // 메일 발송 버튼이 눌렸는지 확인
  // 눌렸으면 추가 텍스트 표시
  // 버튼 비활성화

  // 메일 인증 완료됐는지 확인
  // 확인됐으면 메일 발송 버튼 비활성화

  bool isPressed = false;
  late int emailResendTimer;
  int emailResendSecondsLimit = 60;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.labelPadding),
          child: const Text('호서대학교 이메일'),
        ),
        SizedBox(height: widget.heightOfSizedBoxBetweenLabelAndField),
        RegisterEmailField(
            emailEditingController: widget.emailEditingController),
        SizedBox(height: widget.heightOfSizedBoxBetweenSubSection),
        const RegisterSendEmailButton(),
      ],
    );
  }
}

class RegisterSendEmailButton extends StatelessWidget {
  const RegisterSendEmailButton({
    super.key,
  });

  // TODO
  // http를 통해 메일 전송 요청 송신

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          border: Border.all(
            width: 1,
            color: const Color(0xffc01a24),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text('인증메일 발송'),
          ),
        ),
      ),
    );
  }
}

class RegisterEmailField extends StatelessWidget {
  const RegisterEmailField({
    super.key,
    required this.emailEditingController,
  });

  final TextEditingController emailEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailEditingController,
      textAlign: TextAlign.start,
      maxLength: 8,
      decoration: InputDecoration(
        hintText: '학번',
        suffixIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                '@vision.hoseo.edu',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .withOpacity(0.5)),
              ),
            ),
          ],
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onBackground
                .withOpacity(0.5)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.075),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      ),
    );
  }
}
