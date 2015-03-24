//Símbolo desde el escenario con AS3 como solia hacerse en AS2
cuadrado_mc.alpha = .7;

//Símbolo dinámico con AS3
var cuadradito:Cuadrado = new Cuadrado();

cuadradito.x = stage.stageWidth/2;
cuadradito.y = stage.stageHeight/2;
cuadradito.z = 19;
cuadradito.scaleX = 2;
cuadradito.scaleY = 3;
cuadradito.scaleZ = 4;
cuadradito.rotationX = 15;
cuadradito.rotationY = 15;
cuadradito.rotationZ = 15;
cuadradito.alpha=.5;

addChild(cuadradito);