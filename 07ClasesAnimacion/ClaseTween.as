//librerias
/* 
Aceleraciones
Tipos                          Aplicacion

Back-Se extiende y Regresa     easeIn    suavizado al principio
Bounce-Rebotar                 easeOut   suavizado al final
Elastic-Elastico               easeInOut suavizado uniforme
Regular-Normal                 easeNone  sin suavizado
None-Ninguna
Strong-Muy marcada

None y easeNone solo funcionan entre ellos no funcionan con las demas estan casadas; las otras funcionan entre si aunque con algunas diferencias algunas no son compatibles entre si
*/
import flash.display.Loader;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.MouseEvent;
import fl.transitions.Tween;
import fl.transitions.easing.*;

//variables
var atras:Flecha = new Flecha();
var adelante:Flecha = new Flecha();
var cara:Cara = new Cara();
var loader:Loader = new Loader();
var urlRequest:URLRequest = new URLRequest("AngelIndependencia.jpg");

//funciones
function mover(objeto:Object,atributo:String,aceleracion:Function,inicio:Number,fin:Number,duracion:Number,segundos:Boolean):void{
	//var movimiento:Tween = new Tween(queObjeto, queAtributo, queAceleracion, posicionInicial, posicionFinal, duracion, sonSegundos);
	var movimiento:Tween = new Tween(objeto,atributo,aceleracion,inicio,fin,duracion,segundos);
}

function avanzar(evento:MouseEvent):void {
	mover(cara,"x",Elastic.easeInOut,cara.x,cara.x+200,3,true);
	mover(cara,"alpha",Strong.easeIn,1,.5,5,true);
	mover(cara,"rotation",Back.easeInOut,0,360,7,true);
}

function retroceder(evento:MouseEvent):void{
	mover(cara,"x",Elastic.easeOut,cara.x,cara.x-200,3,true);
	mover(cara,"alpha",Elastic.easeOut,.5,1,3,true);
	mover(cara,"rotation",Strong.easeInOut,360,0,3,true);
}

function aparecer(evento:Event):void{
	mover(loader,"x",Elastic.easeOut,0,500,3,true);
	mover(loader,"y",Elastic.easeOut,0,400,3,true);
	mover(loader,"alpha",Elastic.easeOut,0,1,3,true);
	mover(loader,"rotationX",Strong.easeInOut,0,360,3,true);
	mover(loader,"rotationY",Strong.easeInOut,0,360,3,true);
}

//eventos
adelante.addEventListener(MouseEvent.CLICK,avanzar);
atras.addEventListener(MouseEvent.CLICK,retroceder);
loader.contentLoaderInfo.addEventListener(Event.COMPLETE, aparecer);

//estados iniciales
atras.x = atras.y = adelante.y = 10;
adelante.x = atras.x + atras.width + adelante.width + 20;
adelante.scaleX = -1;
adelante.buttonMode = atras.buttonMode = true;
cara.x = 100;
cara.y = 300;

loader.load(urlRequest);
loader.scaleX = loader.scaleY = .5;

addChild(loader);
addChild(atras);
addChild(adelante);
addChild(cara);