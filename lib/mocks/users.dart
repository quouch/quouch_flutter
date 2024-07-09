import 'package:quouch_app/models/profile.dart';

const String profilePicture =
    'https://res.cloudinary.com/dtkxl0tbk/image/upload/v1679925300/profile.jpg';

const Profile testProfile = Profile(
  name: 'Zach',
  profileImageUrl: profilePicture,
  isSuperhost: true,
);
