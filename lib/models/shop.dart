import 'package:electronics/models/Gpu.dart';
import "package:flutter/material.dart";

class Shop extends ChangeNotifier {
  final List<Gpu> _gpuList = [
    Gpu(
      imagePath: "assets/images/4060 ti 8gb Palit.png",
      name: "4060 ti Palit",
      ram: "8",
      price: "300",
      typeRam: "GDDR6",
      rating: "4.7",
      description:
          """Видеокарта Palit GeForce RTX 4060 Ti Dual OC [NE6406TT19P1-1060D] предлагает высокую производительность и подходящий для игр и других графически интенсивных задач функционал. Эта модель базируется на архитектуре NVIDIA Ada Lovelace. Благодаря поддержке аппаратного трассирования лучей вы сможете наслаждаться реалистичной графикой и эффектами освещения в играх и приложениях.
Palit GeForce RTX 4060 Ti Dual OC [NE6406TT19P1-1060D] оснащена 8 ГБ видеопамяти GDDR6, что улучшает производительность и позволяет работать с более крупными текстурами и моделями. Карта имеет тройную систему охлаждения из 3 осевых вентиляторов. Благодаря этому вы можете наслаждаться длительными игровыми сессиями без снижения производительности.""",
    ),
    Gpu(
      imagePath: "assets/images/RTX 4090 ti.png",
      name: "4090 ti",
      ram: "24",
      price: "1000",
      typeRam: "GDDR6X",
      rating: "4.9",
      description:
          """NVIDIA® GeForce RTX™ 4090 - это лучшая видеокарта GeForce. Она обеспечивает огромный скачок в производительности, эффективности и графике на базе ИИ. Оцените ультравысокую производительность игр, невероятно детализированные виртуальные миры, беспрецедентную производительность и новые творческие возможности. Эти видеокарты основаны на архитектуре NVIDIA Ada Lovelace, оснащены 24 ГБ памяти G6X и обеспечивают непревзойденный опыт для геймеров и создателей контента.""",
    ),
    Gpu(
      imagePath: "assets/images/RTX 4070 ti Aorus.png",
      name: "4070 ti Super Aorus",
      ram: "8",
      price: "550",
      typeRam: "GDDR6",
      rating: "4.6",
      description:
          """Видеокарта GIGABYTE GeForce RTX 4070Ti SUPER AORUS MASTER создана для геймеров и моддеров. Она оборудована архитектурой NVIDIA Ada Lovelace и обеспечивает высокую графическую производительность при поддержке искусственного интеллекта и плавность воспроизведения визуальных эффектов. Процессор функционирует на частоте 2340 МГц, способной повышаться до значения 2670 МГц в режиме разгона. Видеокарта оснащена 16 ГБ памяти стандарта GDDR6X. Система охлаждения WINDFORCE с тремя вентиляторами гарантирует эффективное отведение тепла от внутренних компонентов. Лопасти вентиляторы украшены кольцевой подсветкой со светодиодами RGB. Тыловая сторона усилена металлической пластиной для повышения прочности всей конструкции. Вывод изображения на мониторы в GIGABYTE GeForce RTX 4070Ti SUPER AORUS MASTER реализован с помощью 3 разъемов DisplayPort и 1 HDMI.""",
    ),
  ];

  //customer cart
  final List<Gpu> _cart = [];

  //getter methods
  List<Gpu> get gpuList => _gpuList;
  List<Gpu> get cart => _cart;

  //add to cart
  void addToCart(Gpu gpuListItem, int quantity) {
    for (var i = 0; i < quantity; i++) {
      _cart.add(gpuListItem);
    }
    notifyListeners();
  }

  void removeToCart(Gpu gpu) {
    _cart.remove(gpu);
    notifyListeners();
  }
}
