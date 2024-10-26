import plagas.*

class Barrios {
  const elementos = []

  method esCopado() = self.elementosBuenos() > self.elementosNoBuenos()

  method elementosBuenos() = elementos.count({e => e.esBueno()})

  method elementosNoBuenos() = elementos.count({e => !e.esBueno()})
}

class Hogar {
  var mugre
  const confort

  method esBueno() = mugre <= confort / 2 

  method ataqueDeUnPlaga(unaPLaga) {
    mugre = mugre + unaPLaga.nivelDeDanio()
  }  
}

class Huerta {
  var produccion 

  method esBueno() = produccion > nivelDeProduccion.valor()

  method ataqueDeUnPlaga(unaPLaga) {
    if(unaPLaga.trasmiteEnfermedades()){
      produccion = 0.max(produccion - (unaPLaga.nivelDeDanio() * 0.1) - 10)
    }else{
      produccion = 0.max(produccion - (unaPLaga.nivelDeDanio() * 0.1))
    }
  } 
}

object nivelDeProduccion {
  var property valor = 0 
}

class Mascota {
  var salud 

  method esBueno() = salud > 250

  method ataqueDeUnPlaga(unaPLaga) {
    if(unaPLaga.trasmiteEnfermedades()){
      salud = 0.max(salud - unaPLaga.nivelDeDanio())
    }
  } 
}