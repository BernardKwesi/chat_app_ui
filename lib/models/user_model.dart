class User {
  final String id;
  final String name;
  final String surname;
  final String imageUrl;

  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.imageUrl});

  static List<User> users = [
    User(
      id: '1',
      name: 'John',
      surname: 'Whitaker',
      imageUrl:
          'https://images.unsplash.com/photo-1570295999919-56…fHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
    ),
  ];
}
