import 'package:fave_places/data/categories.dart';
import 'package:fave_places/models/category.dart';
import 'package:fave_places/models/place.dart';

List<Place> dummyPlaces = [
  Place(
    name: 'Bohol Freedive',
    date: DateTime.utc(2024, 02, 14),
    imageUrl: 'https://i0.wp.com/misskhae.com/wp-content/uploads/2023/06/bhb.jpg?resize=1024%2C576&ssl=1',
    lat: '14.5317306',
    long: '120.9826794',
    category: categories[Categories.beaches]!,
    description: '',
  ),
  Place(
    name: 'Sili Cafe',
    date: DateTime.utc(2024, 11, 24),
    imageUrl:
        'https://scontent.fmnl14-1.fna.fbcdn.net/v/t39.30808-6/311480560_5808297432524777_5862615658213344058_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=cc71e4&_nc_eui2=AeGQpIOp_cDxX109oim7f96C-ruCjHcn3nz6u4KMdyfefC4paroRTHxKK0gW2yPCFujtpUzoJ5q4CABrLKo0_Eem&_nc_ohc=fQttz0v70QMQ7kNvgG1lUgh&_nc_oc=AdjYfuF8U6HwLLY27Bk1J7Be0VJbC6ec4cZQ2UBb26caTz0kbjI8A-e9jnuSGKnQxRs&_nc_zt=23&_nc_ht=scontent.fmnl14-1.fna&_nc_gid=AoenltKbSPGVH8SaYMRfkhZ&oh=00_AYBVJZXJN6OAMVmQ7jhZRgf_LHTV1Z7E6Q4EQumN51iw7Q&oe=67C5C0CA',
    lat: '14.5942347',
    long: '120.9813612',
    category: categories[Categories.cafe]!,
    description: '',
  ),
  Place(
    name: 'Arroceros Forest Park',
    date: DateTime.utc(2024, 11, 24),
    imageUrl: 'https://billionbricks.org/wp-content/uploads/2023/11/arroceros-urban-forest-park-walk-path.jpeg',
    lat: '14.5942347',
    long: '120.9813612',
    category: categories[Categories.parks]!,
    description: '',
  ),
];
