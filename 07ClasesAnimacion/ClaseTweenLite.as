//librerias
import flash.display.Loader;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.MouseEvent;
import com.greensock.TweenLite;
//TweenLite.to(objeto,duracion,{propiedad1:valor1,propiedad2:valor2});

//variables
var atras:Flecha = new Flecha();
var adelante:Flecha = new Flecha();
var cara:Cara = new Cara();
var loader:Loader = new Loader();
var urlRequest:URLRequest = new URLRequest("AngelIndependencia.jpg");

//funciones
function avanzar(evento:MouseEvent):void{
	cara.rotation = cara.alpha = 0;
	TweenLite.to(cara,3,{x:cara.x+200,rotation:360,alpha:1});
}

function retroceder(evento:MouseEvent):void{
	cara.rotation = -360;
	cara.alpha = 1;
	TweenLite.to(cara,3,{x:cara.x-200,rotation:360,alpha:0});
}

function aparecer(evento:Event):void{
	TweenLite.to(loader,3,{alpha:1,x:500,y:400,rotationX:360,rotationY:360});
}

//eventos
adelante.addEventListener(MouseEvent.CLICK,avanzar);
atras.addEventListener(MouseEvent.CLICK,retroceder);
loader.contentLoaderInfo.addEventListener(Event.COMPLETE, aparecer);

//estados iniciales
atras.x = atras.y = adelante.y = 10;
adelante.scaleX = -1;
adelante.x = atras.x + atras.width + adelante.width + 20;
adelante.buttonMode = atras.buttonMode = true;
cara.x = 100;
cara.y = 300;

loader.load(urlRequest);
loader.scaleX = loader.scaleY = .5;
loader.alpha = 0;

addChild(loader);
addChild(atras);
addChild(adelante);
addChild(cara);