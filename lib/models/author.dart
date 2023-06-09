class Author {
  final int id;
  final String name;
  final String authorName;
  final String email;
  final String? profileImage;
  final String? phoneNumber;

  Author({
    required this.id,
    required this.name,
    required this.authorName,
    required this.email,
    this.profileImage,
    this.phoneNumber,
  });

  factory Author.dummy() {
    return Author(
      id: 2006061,
      name: "Shopi Nurhidayanti",
      authorName: "shoyaaa.is",
      email: "2006061@itg.ac.id",
      profileImage:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgWmbJ3C3OaZ5R5_k5gedfywbLbuZbgsHiQuBIr2S6wCMF9Vri_DgXwIp3Cp3I4j_NQQg&usqp=CAU",
      phoneNumber: "081224501871",
    );
  }
}
