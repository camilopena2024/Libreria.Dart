import 'dart:io';
class Libro {
  String titulo;
  String autor;
  double precio;
  int cantidadStock;

  Libro(this.titulo, this.autor, this.precio, this.cantidadStock);

  void comprar(int cantidadComprar) {
    if (cantidadComprar <= cantidadStock) {
      cantidadStock -= cantidadComprar;
      print("Compra lista, Quedan $cantidadStock copias en stock");
    } else {
      print("No hay suficientes copias en stock");
    }
  }
  void mostrarInformacion() {
    print("Título $titulo");
    print("Autor $autor");
    print("Precio \$${precio.toStringAsFixed(2)}");
    print("Cantidad en stock $cantidadStock");
  }
}
void main() {
  List<Libro> libros = [];
  while (true) {
    print("\nMenu");
    print("1. Agregar un nuevo libro");
    print("2. Comprar un libro");
    print("3. Ver información de los libros");
    print("4. Salir");
    stdout.write("Seleccione una opción");
    var opcion = stdin.readLineSync();
    switch (opcion) {
      case '1':
        print("\nIngresa la información del libro que desea agregar");
        stdout.write("Título");
        var titulo = stdin.readLineSync();
        stdout.write("Autor");
        var autor = stdin.readLineSync();
        stdout.write("Precio");
        var precioInput = stdin.readLineSync();
        var precio = double.tryParse(precioInput ?? '');
        stdout.write("Cantidad en stock");
        var cantidadStockInput = stdin.readLineSync();
        var cantidadStock = int.tryParse(cantidadStockInput ?? '');
        if (titulo != null &&
            autor != null &&
            precio != null &&
            cantidadStock != null) {
          libros.add(Libro(titulo, autor, precio, cantidadStock));
          print("El libro\"$titulo\"se agregó al stock");
        } else {
          print("Por favor ingrese información válida para el libro");
        }
        break;
      case '2':
      case '2':
        if (libros.isEmpty) {
          print("No hay libros en stock");
        } else {
          print("\nSeleccione el número del libro que desea comprar");
          for (var i = 0; i < libros.length; i++) {
            print("${i + 1}. ${libros[i].titulo}");
          }
          stdout.write("Número del libro");
          var indiceLibro = int.tryParse(stdin.readLineSync()?? '');
          if (indiceLibro != null &&
              indiceLibro >= 1 &&
              indiceLibro <= libros.length) {
            stdout.write("Cantidad de copias a comprar");
            var cantidadComprarInput = stdin.readLineSync();
            var cantidadComprar = int.tryParse(cantidadComprarInput?? '');
            if (cantidadComprar != null) {
              var precioTotal =
                  libros[indiceLibro - 1].precio * cantidadComprar;
              libros[indiceLibro - 1].comprar(cantidadComprar);
              print("Precio total: \$${precioTotal.toStringAsFixed(2)}");
              print("GRACIAS POR TU COMPRA, VUELVE PRONTO");
            } else {
              print("Por favor ingresa una cantidad válida");
            }
          } else {
            print("Por favor selecciona un número válido");
          }
        }
        break;
      case '3':
        if (libros.isEmpty) {
          print("No hay libros en stock");
        } else {
          print("\nInformación de los libros");
          for (var i = 0; i < libros.length; i++) {
            print("\nLibro ${i + 1}:");
            libros[i].mostrarInformacion();
          }
        }
        break;
      case '4':
        print("Adiós y Gracias");
        return;
      default:
        print("Por favor seleccione una opción válida");}
        }
}