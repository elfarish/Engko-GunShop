class Product {
  final String name;
  final double price; // Harga dalam USD
  final String image;
  final String description;

  const Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

// Harga IDR dikonversi ke USD (dibagi 15000)
const List<Product> dummyProducts = [
  Product(
    name: 'Tactical Combat Knife',
    price: 23.33, // 350000 / 15000
    image: 'assets/images/products/tactical_combat_knife.jpg',
    description:
        'This combat knife is specially designed to withstand extreme conditions in the field. Made with stainless steel for precise and reliable cutting performance. The non-slip rubber handle ensures a firm grip even in wet environments. Ideal for survival, outdoor activities, and tactical missions.',
  ),
  Product(
    name: 'Military Grenade Dummy',
    price: 10.0,
    image: 'assets/images/products/military_grenade_dummy.jpg',
    description:
        'This realistic replica of a military hand grenade is made from lightweight, safe materials. Perfect for training simulations, decoration, or cosplay props. It does not contain any explosive components, making it completely safe and legal to own.',
  ),
  Product(
    name: 'Tactical Backpack 45L',
    price: 30.0,
    image: 'assets/images/products/tactical_backpack_45L.jpg',
    description:
        'This 45-liter tactical backpack is designed for outdoor enthusiasts and military purposes. Equipped with a MOLLE system for attaching extra pouches and gear. With a spacious main compartment and multiple storage sections, it’s perfect for carrying survival equipment, logistics, or protective gear.',
  ),
  Product(
    name: 'Glock 19 Pistol',
    price: 20.0,
    image: 'assets/images/products/glock_19 _pistol.jpg',
    description:
        'A high-detail replica of the compact Glock 19 pistol. Lightweight and authentic in design, this model is perfect for airsoft, tactical training, or personal collections. Built with high-quality materials for a realistic handling experience.',
  ),
  Product(
    name: '9mm Dummy Ammo (Pack)',
    price: 6.67,
    image: 'assets/images/products/9mm_dummy_ammo.jpg',
    description:
        'This set of 9mm dummy rounds is designed with precision details for training purposes. Ideal for magazine loading practice, weapon simulations, or display. Contains no active components, ensuring 100% safe handling and storage.',
  ),
  Product(
    name: 'Tactical Gloves - Black Edition',
    price: 5.67,
    image: 'assets/images/products/tactical_gloves.jpg',
    description:
        'These tactical gloves provide excellent protection and grip for heavy-duty tasks. The palm area is reinforced for stronger traction, while the back features hard-shell padding to reduce injury risks. Suitable for close combat, airsoft, outdoor sports, or tactical operations.',
  ),
  Product(
    name: 'MP5 Submachine Gun',
    price: 5.67,
    image: 'assets/images/products/mp5_submachine_gun.jpg',
    description:
        'A highly detailed replica of the legendary MP5 submachine gun. Compact, accurate, and fully accessorized with rails and sights. Perfect for airsoft use, training scenarios, or tactical display collections. A must-have for any tactical enthusiast.',
  ),
  Product(
    name: 'Tactical Helmet with Headset',
    price: 5.67,
    image: 'assets/images/products/tactical_helmet.jpg',
    description:
        'A full tactical helmet equipped with a built-in communication headset. Ideal for mil-sim games, real-life field operations, or airsoft. Made from durable yet lightweight materials, it provides both protection and comfort for long-term use.',
  ),
  Product(
    name: 'Full-Face Gas Mask',
    price: 5.67,
    image: 'assets/images/products/full_face.jpg',
    description:
        'This full-face gas mask offers maximum protection from harmful gases, chemical vapors, and dust. Equipped with dual filters and an anti-fog visor for clear vision. Ideal for military use, industrial safety, or emergency response simulations.',
  ),
  Product(
    name: 'Tactical Plate Carrier Vest',
    price: 5.67,
    image: 'assets/images/products/tactical_plate.jpg',
    description:
        'This plate carrier vest features slots for ballistic plates and full MOLLE webbing to attach essential gear. Designed for high-risk tactical operations, it offers vital protection while keeping your loadout accessible. Adjustable straps ensure a secure and comfortable fit.',
  ),
  Product(
    name: 'AR-15 Assault Rifle',
    price: 5.67,
    image: 'assets/images/products/assault_rifle.jpg',
    description:
        'A modern and modular replica of the AR-15 assault rifle. Built with a durable metal-polymer frame and detailed components for realism. Ideal for airsoft training, display, or realistic tactical scenarios. Equipped with Picatinny rails for attaching scopes and accessories.',
  ),
  Product(
    name: 'First Aid Tactical Kit',
    price: 5.67,
    image: 'assets/images/products/tactical_kit.jpg',
    description:
        'This all-in-one tactical first aid kit includes essential medical supplies such as bandages, tourniquet, medical scissors, and antiseptics. Packed in a compact, military-grade waterproof pouch, it’s ideal for emergencies in the field or outdoor survival situations.',
  ),
];
