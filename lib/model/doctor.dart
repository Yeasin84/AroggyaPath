import 'review.dart';

class Doctor {
  final int doctorId;
  final String name, specialist, about, location, image;
  final String price;
  final int color;
  final List<Review> reviews;

  const Doctor({
    required this.doctorId,
    required this.name,
    required this.specialist,
    required this.about,
    required this.location,
    required this.image,
    required this.color,
    required this.price,
    required this.reviews,
  });
}

List<Doctor> doctors = [
  Doctor(
    doctorId: 1,
    name: "জাতীয় জরুরি সেবা",
    specialist: "৯৯৯",
    about: 'যেকোনো পরিস্থিতিতে এখন সবচেয়ে জরুরি নম্বর হলো ৯৯৯। এটি দেশের জাতীয় জরুরি সেবা নম্বর। যেকোনো দুর্ঘটনার মুখোমুখি হলে জরুরি সেবা পেতে দেশের যেকোনো স্থান থেকে যে কেউ এই নম্বরে ফোন করতে পারেন। পুলিশের অধীনে এই কল সেন্টার পরিচালিত হচ্ছে। এই নম্বরে ফোন করে পুলিশ, ফায়ার সার্ভিস ও অ্যাম্বুলেন্স সেবা কিংবা এ–সংক্রান্ত তথ্য পাওয়া যাবে। দিনরাত ২৪ ঘণ্টা এ কল সেন্টার চালু থাকে। যেকোনো ফোন থেকে বিনা মূল্যে ৯৯৯ নম্বরে ফোন করা যায়।',
    location: "এটি দেশের জাতীয় জরুরি সেবা নম্বর",
    price: 'চার্জ ফ্রী',
    image: "https://images.prothomalo.com/prothomalo%2Fimport%2Fmedia%2F2018%2F06%2F15%2F47611b2ea1cfb3fe36681b920356a944-5b2344dab1abb.jpg?auto=format%2Ccompress&format=webp&w=640&dpr=1.4",
    color: 0xFFffcdcf,
    reviews: [reviews[0], reviews[1], reviews[2], reviews[3],reviews[4]],
  ),
  Doctor(
    doctorId: 2,
    name: "স্বাস্থ্য বাতায়ন ",
    specialist: "১৬২৬৩",
    about: "যেকোনো সময় যে কেউ অসুস্থ হয়ে যেতে পারে। এ সময় হয়তো আপনি পরিচিত কোনো চিকিৎসককে ফোন করে পাচ্ছেন না; আবার কারও কারও পরিচিত কোনো চিকিৎসক না–ও থাকতে পারে। এমন পরিস্থিতিতে নিশ্চিন্তে ফোন করা যাবে স্বাস্থ্য বাতায়নের হেল্পলাইন ১৬২৬৩ নম্বরে। এটি স্বাস্থ্য মন্ত্রণালয় পরিচালিত হেল্পলাইন। এই নম্বরে ফোন করে স্বাস্থ্যসংক্রান্ত যেকোনো বিষয়ে সরাসরি চিকিৎসকের সঙ্গে কথা বলে আপনি পরামর্শ পেতে পারেন। দিনরাত ২৪ ঘণ্টা খোলা থাকে এই নম্বর।",
    location: "এটি স্বাস্থ্য মন্ত্রণালয় পরিচালিত হেল্পলাইন",
    price: 'প্রতিমিনিট ২.৩৭ টাকা চার্জ (ভ্যাটসহ)',
    image: "http://16263.dghs.gov.bd/images/sb-logo.png",
    color: 0xFFf9d8b9,
    reviews: [reviews[5], reviews[6], reviews[7],],
  ),
  Doctor(
    doctorId: 3,
    name: "নারী ও শিশু নির্যাতন প্রতিরোধ সেল ",
    specialist: "১০৯২১",
    about:"আমাদের দেশে নারী ও শিশু নির্যাতনের ঘটনা ঘটে প্রতিনিয়ত। এই নির্যাতন প্রতিরোধে ‘নারী ও শিশু নির্যাতন প্রতিরোধ সেল’ চালু করা হয়েছে, যার নম্বর ১০৯২১। কোনো নারী নির্যাতনের শিকার হলে, বখাটেদের আক্রমণের মুখে পড়লে অথবা অপমানিত হওয়ার আশঙ্কা করলে সঙ্গে সঙ্গে এই নম্বরে ফোন করে সাহায্য চাইতে পারেন। মহিলা ও শিশুবিষয়ক মন্ত্রণালয়ের অধীনে নারী নির্যাতন প্রতিরোধকল্পে মাল্টিসেক্টরাল কর্মসূচির আওতায় এই কর্মসূচি পরিচালিত হচ্ছে। এ নম্বরে ফোন করতে কোনো চার্জ দিতে হবে না। সপ্তাহের সাত দিন ২৪ ঘণ্টা খোলা থাকে এই নম্বর।",
    location: "এটি মহিলা ও শিশুবিষয়ক মন্ত্রণালয় পরিচালিত হেল্পলাইন",
    price: 'চার্জ ফ্রী',
    image: "https://mowca.portal.gov.bd/sites/default/files/files/mowca.portal.gov.bd/npfblock//109%20Logo%20Final.jpg",
    color: 0xFFccd1fa,
    reviews: [reviews[3], reviews[2], reviews[1]],
  ),
  Doctor(
    doctorId: 4,
    name: "চাইল্ড হেল্প লাইন",
    specialist: "১০৯৮",
    about:"সুবিধাবঞ্চিত নির্যাতিত ও বিপদাপন্ন শিশুদের ২৪ ঘণ্টা জরুরি সহায়তা সেবা দিতে ২০১১ সালে যাত্রা শুরু করে চাইল্ড হেল্পলাইন ১০৯৮। সমাজসেবা অধিদপ্তরের তত্ত্বাবধান অপরাজেয় বাংলাদেশ নামের একটি বেসরকারি সংস্থা এই হেল্পলাইন পরিচালনা করছে। এই নম্বরে ফোন করতে কোনো চার্জ প্রযোজ্য হবে না।",
    location: "এটি অপরাজেয় বাংলাদেশ দ্বারা পরিচালিত",
    price: 'চার্জ ফ্রী',
    image: "https://dss.portal.gov.bd/sites/default/files/files/dss.portal.gov.bd/page/56396438_1532_47ad_9afd_9bbdb21883ca/Helpline%20LOGO%20copy.jpg",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[4], reviews[6], reviews[7]],
  ),
  Doctor(
    doctorId: 5,
    name: "ইউনিয়ন পরিষদ হেল্প লাইন",
    specialist: "১৬২৫৬",
    about:"ইউনিয়ন পরিষদ পর্যায়ে যেকোনো ভাতা বা অনুদানসংক্রান্ত তথ্য ও পরামর্শ সেবা দিতে ২০১২ সালে যাত্রা শুরু করে ইউনিয়ন পরিষদ হেল্পলাইন ১৬২৫৬। যে–কেউ দেশের যেকোনো স্থান থেকে ফোন করে এই সেবা নিতে পারবেন। যেকোনো মোবাইল অপারেটর থেকে এই নম্বরে ফোন করা যাবে। এ জন্য স্বাভাবিক কল রেট প্রযোজ্য হবে।",
    location: "এটি এলজিআরডি এর স্থানীয় সরকার বিভাগ দ্বারা পরিচালিত",
    price:'স্বাভাবিক কল রেট প্রযোজ্য',
    image: "https://synesisit.com.bd/wp-content/uploads/2022/09/lg-helpline-200x200.png",
    color: 0xFFe1edf8,
    reviews: [reviews[1], reviews[3], reviews[5]],
  ),
  
];


rate(Doctor doctor) {
  double rate = 0;
  for (var element in doctor.reviews) {
    rate += element.rate;
  }
  return rate / doctor.reviews.length;
}
