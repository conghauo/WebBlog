import * as THREE from "../js/build/three.module.js";
import { TransformControls } from "../js/jsm/controls/TransformControls.js"
import Stats  from "../js/jsm/libs/stats.module.js";
import { Flow } from "../js/jsm/modifiers/CurveModifier.js";
import { TextGeometry }  from "../js/jsm/geometries/TextGeometry.js";
const ACTION_SELECT = 1, ACTION_NONE = 0;
		
			const mouse = new THREE.Vector2();

			let stats, objectToCurve;
			let scene,
				camera,
				renderer,
				action;
			var raycaster = new THREE.Raycaster(),intersects;
			
			var targets = [] ;
			// use 21 imgages 
			var imgs = ['../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg'];
			var cards = [
			{ x: -3.3, y: 0, z: - 1.2 , move: false , object: new THREE.Mesh()},
			{ x: -2.2 , y: 0, z: - 1.2 , move: false, object:new THREE.Mesh() },
			{ x: -1.1, y: 0, z: - 1.2  , move: false, object: new THREE.Mesh()},
			{ x: 0, y: 0, z: - 1.2  , move: false, object: new THREE.Mesh()},
			{ x: 1, y: 0, z: - 1.2 , move: false , object:new THREE.Mesh()},
			{ x: 2, y: 0, z: - 1.2 , move: false , object:new THREE.Mesh()},
			{ x: 3, y: 0, z: - 1.2  , move: false, object:new THREE.Mesh()},
			{ x: -3.3, y: 0, z: 0 , move: false , object: new THREE.Mesh()},
			{ x: -2.2 , y: 0, z: 0 , move: false, object:new THREE.Mesh() },
			{ x: -1.1, y: 0, z: 0  , move: false, object: new THREE.Mesh()},
			{ x: 0, y: 0, z: 0 , move: false, object: new THREE.Mesh()},
			{ x: 1, y: 0, z: 0 , move: false , object:new THREE.Mesh()},
			{ x: 2, y: 0, z: 0 , move: false , object:new THREE.Mesh()},
			{ x: 3, y: 0, z: 0 , move: false, object:new THREE.Mesh()},
			{ x: -3.3, y: 0, z: 1.2 , move: false , object: new THREE.Mesh()},
			{ x: -2.2 , y: 0, z: 1.2 , move: false, object:new THREE.Mesh() },
			{ x: -1.1, y: 0, z: 1.2 , move: false, object: new THREE.Mesh()},
			{ x: 0, y: 0, z: 1.2 , move: false, object: new THREE.Mesh()},
			{ x: 1, y: 0, z: 1.2 , move: false , object:new THREE.Mesh()},
			{ x: 2, y: 0, z: 1.2 , move: false , object:new THREE.Mesh()},
			{ x: 3, y: 0, z: 1.2  , move: false, object:new THREE.Mesh()},
			]
			var start = false;
			init();
			animate();
						
			function init() {

				scene = new THREE.Scene();

				camera = new THREE.PerspectiveCamera(
					40,
					window.innerWidth / window.innerHeight,
					1,
					1000
				);
				camera.position.set( 0, 6, 0 );
				camera.rotation.set( 0, 0,0 );
				camera.lookAt( 0,0,0 );
				camera.updateMatrixWorld();
				
				var imgBg = "../img/backgoundgame.png";
				var txtBg = new THREE.TextureLoader().load( imgBg );
				const geoBg = new THREE.PlaneGeometry(5,5);
				const materialBg = new THREE.MeshBasicMaterial( {map: txtBg, side: THREE.DoubleSide} );
				const Bg = new THREE.Mesh( geoBg, materialBg );
				scene.background = txtBg;
				
				var imgPlay = "../img/play.png";
				var txtPlay = new THREE.TextureLoader().load( imgPlay );
				const geoPlay = new THREE.BoxGeometry(0.5, 0.01 , 0.25);
				const materialPlay = new THREE.MeshBasicMaterial( {map: txtPlay, side: THREE.DoubleSide} );
				const play = new THREE.Mesh( geoPlay, materialPlay );
				play.position.set( -1.3 , 0 , 2 );
				play.rotation.set( 0, 0 ,0 );
				play.callback = function()
				{
				this.visible = false;
					if (start == false)
					{	
						start = true;
						for ( const card of cards ) { card.move = true;}
					}
				}
				targets.push(play);
				scene.add( play );

				var img1 = "../img/Game1/Normal/test.jpg";
								
				var texture1 = new THREE.TextureLoader().load( img1 );
				
				const geometry = new THREE.BoxGeometry( 0.7, 0.01,1)
								
				var materials = [];
				materials.push(new THREE.MeshBasicMaterial( {color: 0xffff00, side: THREE.DoubleSide}));
				materials.push(new THREE.MeshBasicMaterial( {color: 0xffff00, side: THREE.DoubleSide}));
				materials.push(new THREE.MeshBasicMaterial({map: texture1 ,  side: THREE.DoubleSide}));
				materials.push(new THREE.MeshBasicMaterial( {color: 0xffff00, side: THREE.DoubleSide}));
				materials.push(new THREE.MeshBasicMaterial({color: 0xffff00 ,  side: THREE.DoubleSide}));
				materials.push(new THREE.MeshBasicMaterial( {color: 0xffff00, side: THREE.DoubleSide}));
				
				for ( const card of cards ) {				
				card.object = new THREE.Mesh( geometry, materials );
					card.object.position.set(card.x,card.y, card.z);	
					card.object.rotation.set( 0, 0,0 );
					card.object.callback = function()
					{
					console.log("mouse click objectToCurve");
					var i = 0;
					do {
						i += 0.02;
						this.rotation.z = i;
						} while (i < 6);
					//moveTo0(card);
					}
					targets.push(card.object);
					scene.add( card.object );
				}
				
		
				renderer = new THREE.WebGLRenderer( { antialias: true } );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				document.body.appendChild( renderer.domElement );
				renderer.domElement.addEventListener('mousedown', searchTarget, false);
				//renderer.domElement.addEventListener( 'mousedown', onPointerDown );

				stats = new Stats();
				document.body.appendChild( stats.dom );

				window.addEventListener( 'resize', onWindowResize );
				
			}
			function onPointerDown( event ) {
				action = ACTION_SELECT;
				mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
				mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
				camera.position.x =  lerp(camera.position.x , mouse.x,0.3 ); 
			    camera.position.z =  lerp(camera.position.z , mouse.y,0.3 ); 
			}
			function searchTarget(event){
				mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
				mouse.y = - (event.clientY / window.innerHeight) * 2 + 1;
				raycaster.setFromCamera(mouse, camera);
				intersects = raycaster.intersectObjects(targets);
				
				if (intersects.length > 0){
				intersects[0].object.callback();
				// Use the intersected objects: 
				console.log("mouse click mesh");
				console.log(intersects);
				}
			}

				function onWindowResize() {
				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();
				renderer.setSize( window.innerWidth, window.innerHeight );
				}
				//function ease(t) { return t<0.5 ? 2*t*t : -1+(4-2*t)*t}
	
				// linear interpolation function
				function lerp(a, b, t) {return a + (b - a) * t}
				var t = 0.05;
				function moveTo0(card) {	
				if (!card.move)
					return;
				const start = new THREE.Vector3(card.object.position.x, card.object.position.y, card.object.position.z) ;
				//console.log(start);
				const end = new THREE.Vector3(0,0,0) ;
				const newX = lerp(start.x, end.x, (t));   // interpolate between a and b where
				const newY = lerp(start.y, end.y, (t));   // t is first passed through a easing
				const newZ = lerp(start.z, end.z, (t));   // function in this example.
				const newPos = new THREE.Vector3(newX, newY, newZ) ;
				if (isNaN(newX))
					return;
				if (Math.abs(newX) < 0.00001 && Math.abs(newZ) < 0.00001)
				{
					card.move = false;
					card.object.rotation.z = 3;
					return;
				}
				card.object.position.set(newX, newY, newZ);  // set new position
				card.object.rotation.z += t;
				}
				function moveBack(card) {
				if (card.move)
					return;
				const start = new THREE.Vector3(card.object.position.x, card.object.position.y, card.object.position.z) ;
				const end = new THREE.Vector3(card.x,card.y,card.z) ;
				const newX = lerp(start.x, end.x, (t));   // interpolate between a and b where
				const newY = lerp(start.y, end.y, (t));   // t is first passed through a easing
				const newZ = lerp(start.z, end.z, (t));   // function in this example.
				const newPos = new THREE.Vector3(newX, newY, newZ) ;
				if (isNaN(newX))
					return;
				if (Math.abs(newX) < 0.00001 && Math.abs(newZ) < 0.00001)
				{
					return;
				}
				card.object.position.set(newX, newY, newZ);  // set new position
				}	
			
			function animate() {
				requestAnimationFrame( animate );
				render();
				//objectToCurve.rotation.z += 0.02;
				for (const card of cards){
					moveTo0(card);
					if (start == true)
						moveBack(card);
				}
			}

			function render() {
				renderer.render( scene, camera );
				stats.update();
			}