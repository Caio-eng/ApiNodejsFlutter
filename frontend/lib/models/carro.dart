class Carro {
  int id;
  String nome;
  String marca;
  String modelo;

  Carro(this.id, this.nome, this.marca, this.modelo) {
    this.id = id;
    this.nome = nome;
    this.marca = marca;
    this.modelo = modelo;
  }

  Carro.fromJson(Map json)
    : id = json['id'],
      nome = json['nome'],
      marca = json['marca'],
      modelo = json['modelo'];

}