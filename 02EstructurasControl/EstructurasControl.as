//Estructuras de Control en AS3
//if, else if, else
var num1:uint = 19;
var num2:uint = 20;

if(num1>num2){
	trace("num1 es mayor a num2");
}else if(num1==num2){
	trace("num1 es igual a num2");
}else{
	trace("num1 es menor a num2");
}

//switch case
var pais:String = "Mexico";
switch(pais){
	case "Mexico":
	trace(pais);
	break;
	
	case "Uruguay":
	trace(pais);
	break;
	
	case "Argentina":
	trace(pais);
	break;
	
	case "España":
	trace(pais);
	break;
	
	default:
	trace("El país ingresado, no esta contemplado dentro del switch-case");
	break;
}

//for
var i:uint;
for(i=0;i<10;i++){
	trace(i);
}

var navegadores:Array = new Array("Mozilla","Chrome","Safari","IE","Opera","Rockmelt");
var total:uint=navegadores.length;
var j:uint;

for(j=0;j<total;j++){
	trace("Esta es la posición",j,"de mi arreglo navegadores, y este es su valor:",navegadores[j]);
}

//while
var k:uint=10;
while(k>0){
	trace(k);
	k--;
}

//Operadores Lógicos en AS3
var num3:uint = 5;
var num4:uint = 7;
var negar:Boolean = false;

//AND - &&
if(num3<0 && num3>10){
	trace("Se cumple la condición AND");
}else{
	trace("No se cumple la condición AND");
}

//OR - ||
if(num3>10 || num4>10){
	trace("Se cumple la condición OR");
}else{
	trace("No se cumple la condición OR");
}

//NOT - !
if(!negar){
	trace("Se cumplio la condición NOT");
}else{
	trace("No se cumplio la condición NOT");
}