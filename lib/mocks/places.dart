import 'package:quouch_app/mocks/images.dart';
import 'package:quouch_app/mocks/users.dart';
import 'package:quouch_app/models/place.dart';

const Place austinPlace1 = Place(
    title: 'Apartment home deep in the heart of Austin',
    type: PlaceType.apartment,
    city: 'Austin',
    state: 'Texas',
    address: '123 Main St.',
    zipcode: '123456',
    country: 'United States',
    imageUrls: apartmentImages,
    bathCount: 1,
    bedCount: 1,
    bedroomCount: 1,
    costPerNight: 102,
    guestCount: 3,
    numberOfRatings: 72,
    rating: 4.3,
    owner: testProfile);

const Place austinPlace2 = Place(
    title: 'Entire condominium near 6th!',
    type: PlaceType.condominium,
    city: 'Austin',
    state: 'Texas',
    address: '612 State St.',
    zipcode: '123456',
    country: 'United States',
    imageUrls: condoImages,
    bathCount: 2,
    bedCount: 2,
    bedroomCount: 2,
    costPerNight: 162,
    guestCount: 5,
    numberOfRatings: 102,
    rating: 4.7,
    owner: testProfile);

const Place aspen = Place(
    title: 'Cozy Cabin in Aspen',
    type: PlaceType.cabin,
    city: 'Aspen',
    state: 'Colorado',
    address: '123 Grizzly Dr.',
    zipcode: '123456',
    country: 'United States',
    imageUrls: [cabinImageUrl, fireplaceImageUrl, emptyRoomImageUrl],
    bathCount: 2,
    bedCount: 3,
    bedroomCount: 2,
    costPerNight: 201,
    guestCount: 6,
    numberOfRatings: 802,
    rating: 4.8,
    owner: testProfile);

const PlaceList austinList =
    PlaceList(title: 'Austin', savedPlaces: [austinPlace1, austinPlace2]);

const PlaceList aspenList =
    PlaceList(title: 'Aspen, Colorado', savedPlaces: [aspen]);

const String loremIpsumText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec nulla dolor, fermentum nec rhoncus vitae, vehicula quis ipsum. Mauris dapibus velit in quam scelerisque gravida. Etiam luctus augue ut lacus iaculis vehicula. In vel pretium arcu. Fusce fringilla volutpat hendrerit. Morbi nec accumsan nunc. Integer at iaculis justo. Ut dignissim scelerisque mi vitae consectetur. Mauris tincidunt erat at mi feugiat, id gravida justo suscipit. Vestibulum non ipsum varius, sagittis est vitae, ultrices est. Donec semper ligula vel urna ultricies varius. Aenean lacinia risus ut aliquam bibendum. Nullam justo ex, auctor ultricies eros a, commodo dapibus massa. Etiam tristique semper tempus. Vivamus elementum nisl neque, eu eleifend metus lobortis sed.';
