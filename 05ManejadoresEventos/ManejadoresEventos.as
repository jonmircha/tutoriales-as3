//librerias
import flash.events.MouseEvent;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.events.KeyboardEvent;

//variables
var huevito:Huevo = new Huevo();
var bextlan:URLRequest = new URLRequest("http://bextlan.com");

//funciones
function arrastrar(evento:MouseEvent):void{
	evento.target.startDrag();
}

function soltar(evento:MouseEvent):void{
	evento.target.stopDrag();
}

function sobre(evento:MouseEvent):void{
	evento.target.gotoAndStop(2);
}

function fuera(evento:MouseEvent):void{
	evento.target.gotoAndStop(1);
}

function accionesBotones(evento:MouseEvent):void{
	switch(evento.target.name){
		case "arriba_btn":
			huevito.y-=5;
			break;
		case "abajo_btn":
			huevito.y += 5;
			break;
		case "izquierda_btn":
			huevito.x-=5;
			break;
		case "derecha_btn":
			huevito.x += 5;
			break;
		case "alphaMas_btn":
			huevito.alpha += .05;
			break;
		case "alphaMenos_btn":
			huevito.alpha -= .05;
			break;
		case "rotarMas_btn":
			huevito.rotation += 15;
			break;
		case "rotarMenos_btn":
			huevito.rotation -= 15;
			break;
		case "tamanioMas_btn":
			huevito.width += 5;
			huevito.height += 5;
			break;
		case "tamanioMenos_btn":
			huevito.width -= 5;
			huevito.height -= 5;
			break;
		case "escalaMas_btn":
			huevito.scaleX += .05;
			huevito.scaleY += .05;
			huevito.scaleZ += .05;
			break;
		case "escalaMenos_btn":
			huevito.scaleX -= .05;
			huevito.scaleY -= .05;
			huevito.scaleZ -= .05;
			break;
		case "habilitado_btn":
			huevito.enabled = true;
			huevito.buttonMode = true;
			huevito.addEventListener(MouseEvent.MOUSE_DOWN,arrastrar);
			huevito.addEventListener(MouseEvent.MOUSE_UP,soltar);
			huevito.addEventListener(MouseEvent.MOUSE_OVER,sobre);
			huevito.addEventListener(MouseEvent.MOUSE_OUT,fuera);
			//trace(huevito.enabled);
			break;
		
		case "inhabilitado_btn":
			huevito.enabled = false;
			huevito.buttonMode = false;
			huevito.removeEventListener(MouseEvent.MOUSE_DOWN,arrastrar);
			huevito.removeEventListener(MouseEvent.MOUSE_UP,soltar);
			huevito.removeEventListener(MouseEvent.MOUSE_OVER,sobre);
			huevito.removeEventListener(MouseEvent.MOUSE_OUT,fuera);
			//trace(huevito.enabled);
			break;
		
		case "visible_btn":
			huevito.visible = true;
			break;
		
		case "invisible_btn":
			huevito.visible = false;
			break;
		
		case "url_btn":
			navigateToURL(bextlan);
			break;
		
		case "reproducir_btn":
			huevito.play();
			break;
			
		case "detener_btn":
			huevito.stop();
			break;
			
		case "resetear_btn":
			huevito.x = stage.stageWidth/2;
			huevito.y = stage.stageHeight/2;
			huevito.alpha = 1;
			huevito.rotation = 0;
			huevito.scaleX = 1;
			huevito.scaleY = 1;
			huevito.scaleZ = 1;
			huevito.rotationX = 0;
			huevito.rotationY = 0;
			huevito.rotationZ = 0;
			huevito.visible = true;
			huevito.enabled = true;
			huevito.buttonMode = true;
			huevito.gotoAndStop(1);
			huevito.addEventListener(MouseEvent.MOUSE_DOWN,arrastrar);
			huevito.addEventListener(MouseEvent.MOUSE_UP,soltar);
			huevito.addEventListener(MouseEvent.MOUSE_OVER,sobre);
			huevito.addEventListener(MouseEvent.MOUSE_OUT,fuera);
			break;			
	}
}

function teclaArriba(evento:KeyboardEvent):void{
	if(evento.keyCode==32) huevito.rotation = 0;

}

function teclaAbajo(evento:KeyboardEvent):void{
	if(evento.keyCode==32) huevito.rotation = 180;
}

function girar(evento:KeyboardEvent):void{
	if(evento.keyCode == 88) huevito.rotationX += 15;
	if(evento.keyCode == 89) huevito.rotationY += 15;
	if(evento.keyCode == 90) huevito.rotationZ += 15;
}

//eventos
//elObjeto.addEventListener(TipoEvento.EL_EVENTO,laFuncion);
huevito.addEventListener(MouseEvent.MOUSE_DOWN,arrastrar);
huevito.addEventListener(MouseEvent.MOUSE_UP,soltar);
huevito.addEventListener(MouseEvent.MOUSE_OVER,sobre);
huevito.addEventListener(MouseEvent.MOUSE_OUT,fuera);
arriba_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
abajo_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
izquierda_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
derecha_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
alphaMas_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
alphaMenos_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
rotarMas_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
rotarMenos_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
tamanioMas_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
tamanioMenos_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
escalaMas_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
escalaMenos_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
habilitado_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
inhabilitado_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
visible_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
invisible_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
url_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
reproducir_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
detener_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
resetear_btn.addEventListener(MouseEvent.CLICK,accionesBotones);
stage.addEventListener(KeyboardEvent.KEY_UP,teclaArriba);
stage.addEventListener(KeyboardEvent.KEY_DOWN,teclaAbajo);
stage.addEventListener(KeyboardEvent.KEY_DOWN,girar);

//estados iniciales
huevito.stop();
huevito.x = stage.stageWidth/2;
huevito.y = stage.stageHeight/2;
//Hacemos que el MovieClip se comporte como un Botón
huevito.buttonMode = true;
addChild(huevito);