import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiWoocommerce {
  final String baseUrl = 'tudominio.com'; //URL de tu página web.
  final String consumerKey =
      'clave pública'; // Clave pública que te proporciona la API
  final String consumerSecret =
      'clave privada'; // Clave privada que te proporciona la API

  // Método para obtener productos de una categoría específica
  Future<List<Producto>> obtenerProductosPorCategoria(
      int categoriaId, int page) async {
    var url = Uri.parse(
        '$baseUrl/products?category=$categoriaId&consumer_key=$consumerKey&consumer_secret=$consumerSecret&page=$page&per_page=20');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Producto> productos = [];
      for (var prod in jsonData) {
        Producto producto = Producto(
          nombre: prod["name"],
          imagen: prod["images"][0]["src"],
          precio:
              prod["price"]?.toString() ?? 'No disponible', // Manejo de nulos
        );
        productos
            // Agrega cada producto a la lista.
            .add(producto);
      }
      return productos;
    } else {
      // control de errores
      throw Exception('Error al obtener productos: ${response.statusCode}');
    }
  }

  // Método para obtener todas las categorías
  Future<List<Categoria>> obtenerCategorias() async {
    var url = Uri.parse(
        '$baseUrl/products/categories?consumer_key=$consumerKey&consumer_secret=$consumerSecret');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      List<Categoria> categorias = [];
      for (var cat in jsonData) {
        Categoria categoria = Categoria(
          id: cat["id"],
          nombre: cat["name"],
        );
        categorias.add(categoria);
      }
      return categorias;
    } else {
      throw Exception('Error al obtener categorías: ${response.statusCode}');
    }
  }
}

// Clase producto donde obtendremos los datos que se requieran del productos.
class Producto {
  final String nombre;
  final String imagen;
  final String precio;

  Producto({
    required this.nombre,
    required this.imagen,
    this.precio = '', // Valor predeterminado en caso de que el precio sea nulo
  });
}

// Clase Categoria
class Categoria {
  final int id;
  final String nombre;

  Categoria({
    required this.id,
    required this.nombre,
  });
}
