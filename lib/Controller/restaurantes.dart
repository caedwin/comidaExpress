// como no tenemos BD creamos los campos de la tabla
//declaramos la estructura de los datos

class Restaurantes{
final int id;
final String nombre;
final String imagen;
final String telefono;
final String categoria;
final String descripcion;
final String direccion;

 const Restaurantes({required this.id,  this.nombre = '', this.imagen = '', this.telefono = '', this.categoria = '',
      this.descripcion = '', this.direccion = '' });
}

// Creamos algunos registros
final locales = [
  const Restaurantes(id: 1, nombre: "Adega Machado", imagen:"/imagenes/restaurantes/Adega-Machado-fachada.jpg",telefono: "319-51156", categoria: "polleras", descripcion: "Nos dedicamos a preparar los menjores platos de comida y que vivas la mejor experiencia en degustación", direccion: "Av. ppal. Los leones, carretera 5, los mangos."),
  const Restaurantes(id: 2, nombre: "Barrio do avillez", imagen:"/imagenes/restaurantes/bairro-do-avillez.jpg",telefono: "319-51156", categoria: "polleras", descripcion: "Nos dedicamos a preparar los menjores platos de comida y que vivas la mejor experiencia en degustación", direccion: "Av. ppal. Los leones, carretera 5, los mangos."),
  const Restaurantes(id: 3, nombre: "Belcato em lisboa", imagen:"/imagenes/restaurantes/belcanto-em-lisboa.jpeg",telefono: "319-51156", categoria: "polleras", descripcion: "Nos dedicamos a preparar los menjores platos de comida y que vivas la mejor experiencia en degustación", direccion: "Av. ppal. Los leones, carretera 5, los mangos."),
  const Restaurantes(id: 4, nombre: "bife a imperio", imagen:"/imagenes/restaurantes/bife-a-imperio.jpg",telefono: "319-51156", categoria: "polleras", descripcion: "Nos dedicamos a preparar los menjores platos de comida y que vivas la mejor experiencia en degustación", direccion: "Av. ppal. Los leones, carretera 5, los mangos."),

];