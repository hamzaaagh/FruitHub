import 'package:flutter/material.dart';

class CustomStepperBar extends StatelessWidget {
  final int currentStep;

  const CustomStepperBar({
    super.key,
    required this.currentStep,
  });

  static const List<String> _steps = [
    'العنوان',
    'الدفع',
  ];

  @override
  Widget build(BuildContext context) {
    // إخفاء الـ Stepper في صفحة النجاح
    if (currentStep == 2) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _steps.length,
            (index) {
              final isCompleted = index < currentStep;
              final isCurrent = index == currentStep;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(
                          milliseconds: 300,
                        ),
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted || isCurrent
                              ? const Color(0xFF1E5631)
                              : Colors.grey.shade300,
                        ),
                        child: Center(
                          child: isCompleted
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isCurrent
                                        ? Colors.white
                                        : Colors.grey.shade600,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Text(
                        _steps[index],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isCurrent
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: isCurrent || isCompleted
                              ? const Color(0xFF1E5631)
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  if (index < _steps.length - 1)
                    Container(
                      width: 60,
                      height: 2,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      color: isCompleted
                          ? const Color(0xFF1E5631)
                          : Colors.grey.shade300,
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}