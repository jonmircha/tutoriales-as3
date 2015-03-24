//Arreglos en AS3
var misColores:Array = new Array("Negro","Naranja","Gris","Blanco");
trace("Arreglo de colores",misColores);

var miArray:Array = new Array("Jonathan MirCha",28,"jonmircha@gmail.com");
trace("Mis datos:",miArray);
trace("Mi nombre:",miArray[0]);
trace("Mi edad:",miArray[1]);
trace("Mi correo:",miArray[2]);

misColores.pop();
//El método pop elimina el último elemento de mi arreglo
trace("Arreglo de colores después del método .pop()",misColores);

//El método push agrega el elemento que se le pone como parámetro al arreglo
misColores.push("Azul");
trace("Arreglo de colores después del método .push()",misColores);

var arrayMultidimensional:Array = new Array(new Array("Negro",0,false),new Array("Blanco",1,true));
trace("Arreglo Multidimensional",arrayMultidimensional);
trace(arrayMultidimensional[1][1]);
trace(arrayMultidimensional[0][2]);

//Objetos en AS3
//Una clase en POO Siempre empieza en Mayúsculas
//Una clase es un modelo y los objetos estan basados en una clase
//Todos entendemos que es un Auto, entonces en POO Auto sería una clase
//Ejemplos de objetos de la Clase Auto serían: Toyota,Chevrolet,Chrysler,Volkswagen,GM,Ford, etc.
//Si yo quisiera declarar e inicializar un objeto de la clase Auto se haría asi:
//var toyota:Auto = new Auto();
//En POO, los objetos hacen cosas y tienen características:
//Un Auto que hace: Acelerar, Frenar, Girar, AbrirPuertas, etc.
//Un Auto que características tiene: Color, NumeroPuertas, Llantas, TipoTransmision, etc.
//En POO las cosas que hacen los objetos se llaman métodos(), ejemplos de metodos: stop(), play(), gotoAndStop()
//En POO las características de los objetos se llaman atributos, ejemplos de atributos: en AS2:_x,_y,_alpha en AS3:x,y,alpha
//La forma de ejecutar un método de un objeto es miObjeto.metodo() y un atributo sería miObjeto.atributo = valor
//Siguiendo con el ejemplo del Auto sería:
//toyota.acelerar();
//toyota.color = "azul";
//En POO hay 3 momentos básicos:
//1)Declarar e inicializar mi objeto. ejem. var miObjeto:Clase = new Clase();
//2)Trabajar con métodos. miObjeto.metodo();
//3)Asignar atributo. miObjeto.atributo = valor;
var objeto:Object = new Object();
objeto.nombre = "Flash";
objeto.empresa = "Adobe";
objeto.numero = 11.5;
objeto.lenguaje = "ActionScript";
objeto.softwareLibre = false;

trace("Nombre del Objeto:",objeto.nombre);
trace("Empresa del Objeto:",objeto.empresa);
trace("Número del Objeto:",objeto.numero);
trace("Lenguaje del Objeto:",objeto.lenguaje);
trace("El objeto es software libre:",objeto.softwareLibre);