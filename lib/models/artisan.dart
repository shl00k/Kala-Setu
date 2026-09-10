class Artisan {
  final String id;
  final String name;
  final String craft;
  final String village;
  final String district;
  final String state;
  final String preferredLanguage;

  const Artisan({
    required this.id,
    this.name = '',
    this.craft = '',
    this.village = '',
    this.district = '',
    this.state = '',
    this.preferredLanguage = 'hi',
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'craft': craft,
        'village': village,
        'district': district,
        'state': state,
        'preferredLanguage': preferredLanguage,
      };
}
