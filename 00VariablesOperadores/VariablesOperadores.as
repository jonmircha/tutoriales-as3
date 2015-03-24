//Variables en AS3
var miNombre:String = "Jo_On";
var miEdad:uint = 27;
var miEstatura:Number = 1.73;
var laTemperatura:int = -10;
var soyHombre:Boolean = true;
var soyMujer:Boolean = false;

trace("Ejemplo de Variables en AS3");
trace("Nombre: "+miNombre);
trace("Edad: "+miEdad);
trace("Estatura: "+miEstatura);
trace("La Temperatura: "+laTemperatura);
trace("Hombre: "+soyHombre);
trace("Mujer: "+soyMujer);

//Operadores en AS3
var cadena1:String = "Esta es mi primer cadena ";
var cadena2:String = "y esta es mi segunda cadena";

var unirCadenas:String = cadena1 + cadena2;
trace("Unir cadenas en AS3");
trace(unirCadenas);

var num1:uint = 19;
var num2:uint = 20;

var suma:uint = num1 + num2;
var resta:int = num1 - num2;
var multiplicacion:uint = num1 * num2;
var division:Number = num1 / num2;

trace("Operadores en AS3");
trace("La suma de num1 y num2 es:",suma);
trace("La resta de num1 y num2 es",resta);
trace("La multiplicacion de num1 y num2 es",multiplicacion);
trace("La división de num1 y num2 es",division);

//Conversión de variables en AS3
var nume1:String = "7";
var nume2:uint = 20;

var conversion1:uint = uint(nume1) + nume2;
var conversion2:int = int(nume1) - nume2;
var conversion3:Number = Number(nume1) / nume2;
var conversion4:String = String(nume1) + nume2.toString();

trace("Conversión de variables en AS3");
trace(conversion1);
trace(conversion2);
trace(conversion3);
trace(conversion4);

//Operadores combinados en AS3
var combinado:uint = 15;
combinado += 20;
trace("Operador Combinado");
trace(combinado);

//Operador unario en AS3
var unario:uint = 25;
unario++;

trace("Operador Unario");
trace(unario);

unario--;
trace(unario);