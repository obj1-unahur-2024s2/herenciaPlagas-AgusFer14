class Plagas {
  var poblacion

  method trasmiteEnfermedades() = poblacion >= 10

  method ataque(elemento) {
    elemento.ataqueDeUnPlaga(self)
    self.efectoDelAtaque()
  }

  method efectoDelAtaque() {
  poblacion = poblacion * 1.1
  }
}

class Cucarachas inherits Plagas {
  var pesoPromedio

  method nivelDeDanio() = poblacion / 2

  override method trasmiteEnfermedades() = super() and pesoPromedio >= 10

  override method efectoDelAtaque() {
    super() 
    pesoPromedio = pesoPromedio + 2
  }
}

class Pulgas inherits Plagas {
  method nivelDeDanio() = poblacion * 2
}

class Garrapatas inherits Pulgas {

  override method efectoDelAtaque() {
    poblacion = poblacion * 1.2
  }
}

class Mosquitos inherits Plagas {
  method nivelDeDanio() = poblacion

  override method trasmiteEnfermedades() = super() and poblacion / 3 == 0
}