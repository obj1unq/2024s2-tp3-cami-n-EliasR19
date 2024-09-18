import cosas.*
import camion.*

object almacen{
    const property stock = []


    method almacenar(cosas){
        stock.addAll(cosas)
    }
}