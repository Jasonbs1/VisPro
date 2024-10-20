import 'dart:math';

// Kelas Vertex yang merepresentasikan titik/simpul dalam graf

class Vertex {
  final int id;
  final double x; // Koordinat X
  final double y; // Koordinat Y
  // Konstruktor untuk inisialisasi Vertex dengan id, x, dan y
  Vertex(this.id, this.x, this.y);
  // Fungsi untuk menghitung jarak Euclidean ke vertex lain
  double distanceTo(Vertex other) {
    // sqrt((x2 - x1)^2 + (y2 - y1)^2) -> Jarak Euclidean
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2));
  }
  // Override toString untuk mencetak informasi vertex
  @override
  String toString() => 'Vertex $id at ($x, $y)';
}
 
// Fungsi untuk menyelesaikan masalah TSP dengan pendekatan greedy
List<Vertex> tsp(List<Vertex> vertices) {
  List<Vertex> visited = []; // List yang menyimpan vertex yang sudah dikunjungi
  List<Vertex> unvisited = List.from(vertices); // Copy list semua vertex sebagai vertex yang belum dikunjungi

  // Pilih vertex pertama sebagai starting point
  Vertex current = unvisited.removeAt(0); // Hapus dari list unvisited
  visited.add(current); // Tandai sebagai visited

  print('Starting at: ${current.toString()}');

  // Ulangi hingga semua vertex dikunjungi
  while (unvisited.isNotEmpty) {
    // Mencari vertex terdekat dari vertex yang sedang dikunjungi
    Vertex nearest = findNearestVertex(current, unvisited);
    
    // Hubungkan ke vertex terdekat
    print('Connecting ${current.toString()} to ${nearest.toString()}');
    
    visited.add(nearest); // Tandai vertex terdekat sebagai dikunjungi
    unvisited.remove(nearest); // Hapus vertex dari daftar unvisited
    current = nearest; // Update current vertex untuk iterasi berikutnya
  }

  return visited; // Mengembalikan jalur yang telah dikunjungi
}

// Fungsi untuk mencari vertex terdekat yang belum dikunjungi
Vertex findNearestVertex(Vertex current, List<Vertex> unvisited) {
  Vertex nearest = unvisited[0]; // Inisialisasi vertex terdekat dengan vertex pertama di list
  double minDistance = current.distanceTo(nearest); // Hitung jarak ke vertex terdekat sementara

  // Bandingkan jarak current ke semua vertex yang belum dikunjungi
  for (var vertex in unvisited) {
    double distance = current.distanceTo(vertex); // Hitung jarak
    print('Distance from ${current.toString()} to ${vertex.toString()} is $distance');

    // Jika ditemukan vertex dengan jarak lebih dekat, update nearest
    if (distance < minDistance) {
      nearest = vertex;
      minDistance = distance;
      print('Updated nearest to ${nearest.toString()} with distance $minDistance');
    }
  }

  return nearest; // Mengembalikan vertex terdekat
}

void main() {
  // Daftar vertex dengan koordinat (x, y)
  List<Vertex> vertices = [
    Vertex(0, 2, 3),  // Vertex 0
    Vertex(1, 5, 5),  // Vertex 1
    Vertex(2, 8, 8),  // Vertex 2
    Vertex(3, 1, 1),  // Vertex 3
    Vertex(4, 7, 2),  // Vertex 4
  ];

  // Panggil fungsi tsp untuk menyelesaikan masalah TSP
  List<Vertex> path = tsp(vertices);

  // Cetak hasil akhir
  print('Final visited path:');
  for (var vertex in path) {
    print(vertex);
  }
}


