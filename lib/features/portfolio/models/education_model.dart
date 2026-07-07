enum EducationType { primary, secondary, outline }

class EducationModel {
  final String degree;
  final String institution;
  final String period;
  final String grade;
  final String? additionalInfo;
  final EducationType type;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.period,
    required this.grade,
    this.additionalInfo,
    required this.type,
  });
}
