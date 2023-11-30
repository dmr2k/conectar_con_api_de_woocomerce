Desarrollo: Daniel Muñoz Redondo 
GitHub: dmr2k https://github.com/dmr2k

Clase ApiWoocommerce:

Define las propiedades baseUrl, consumerKey y consumerSecret para la conexión con la API de Woocommerce.

Contiene dos métodos principales:
-> obtenerProductosPorCategoria: Obtiene los productos de una categoría específica. Utiliza un ID de categoría y un número de página como parámetros. 
Realiza una solicitud GET a la API de Woocommerce, procesa la respuesta JSON y devuelve una lista de productos.

->obtenerCategorias: Obtiene todas las categorías disponibles. Realiza una solicitud GET a la API y devuelve una lista de categorías.
Maneja errores en las respuestas de la API lanzando excepciones si el código de estado no es 200.

Clase Producto:

Representa un producto con propiedades para el nombre, imagen y precio.
El precio tiene un valor predeterminado para manejar casos donde este dato pueda ser nulo.
Clase Categoria:

Representa una categoría con propiedades para el ID y el nombre.
Aspectos Importantes:

El manejo de la respuesta JSON es clave en ambos métodos, donde se transforma la respuesta en listas de objetos Producto o Categoria.
El manejo de errores simple pero efectivo ayuda a identificar problemas con las solicitudes a la API.
La estructura del código es clara y modular, lo que facilita su mantenimiento y escalabilidad.

** IMPORTANTE ** 
Asegurate de agregar las dependencias en el archivo " pubspec.yaml " para poder realizar la petiiones HTTP 