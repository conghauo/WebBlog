import * as THREE from "../js/build/three.module.js";
import { TransformControls } from "../js/jsm/controls/TransformControls.js"
import Stats  from "../js/jsm/libs/stats.module.js";
import { Flow } from "../js/jsm/modifiers/CurveModifier.js";
import { TextGeometry }  from "../js/jsm/geometries/TextGeometry.js";

const ACTION_SELECT = 1, ACTION_NONE = 0;
			const flows = [];
			const mouse = new THREE.Vector2();
			const count_img = 15;
			let stats;
			let scene,
				camera,
				renderer,
				rayCaster,
				control,
				action = ACTION_NONE;
			var raycaster = new THREE.Raycaster(),intersects;
			var speed = 0;
			// use 12 image
			var imgs = ['../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg','../img/Game1/Normal/test.jpg', '../img/Game1/Normal/test2.jpg', '../img/Game1/Normal/test3.jpg'];
			let play;
			var targets = [] ;
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
				camera.position.set( -2, 0, 3 );
				camera.rotation.set( 0, 0,0 );
				camera.lookAt( scene.position );
				const cone = new THREE.ConeGeometry( 0.1, 0.1, 2 );
				const materialone = new THREE.MeshBasicMaterial( {color: 0x00ff00} );
				const m_cone = new THREE.Mesh( cone, materialone );
				m_cone.position.set( -1, -0.3, 0.8 );
				scene.add( m_cone );
				
				var imgPlay = "../img/play.png";
				var txtPlay = new THREE.TextureLoader().load( imgPlay );
				const geoPlay = new THREE.BoxGeometry(0.15, 0.1 , 0.01);
				const materialPlay = new THREE.MeshBasicMaterial( {map: txtPlay, side: THREE.DoubleSide} );
				play = new THREE.Mesh( geoPlay, materialPlay );
				play.position.set( -1.3 , -0.3 , 1.8 );
				play.rotation.set( 0, 50 ,0 );
				play.callback = function()
				{
					speed = (Math.floor(Math.random() * 6) + 1) /100;
				}
				targets.push(play);
				scene.add( play );
				
				var imgBg = "../img/backgoundgame.png";
				var txtBg = new THREE.TextureLoader().load( imgBg );
				const geoBg = new THREE.PlaneGeometry(5,5);
				const materialBg = new THREE.MeshBasicMaterial( {map: txtBg, side: THREE.DoubleSide} );
				const Bg = new THREE.Mesh( geoBg, materialBg );
				scene.background = txtBg;
				
				const initialPoints = [
					{ x: 1, y: 0, z: - 1 },
					{ x: 1, y: 0, z: 1 },
					{ x: - 1, y: 0, z: 1 },
					{ x: - 1, y: 0, z: - 1 },
				];
			
				const boxGeometry = new THREE.BoxGeometry( 0.1, 0.1, 0.1 );
				const boxMaterial = new THREE.MeshBasicMaterial();
		for ( let i = 0; i <  count_img; i ++ ) {
				const curveHandles = [];
				for ( const handlePos of initialPoints ) {

					const handle = new THREE.Mesh( boxGeometry, boxMaterial );
					handle.visible = false;
					handle.position.copy( handlePos );
					curveHandles.push( handle );
					scene.add( handle );

				}
				//ar_curveHandles.push(curveHandles);
				const curve = new THREE.CatmullRomCurve3(
					curveHandles.map( ( handle ) => handle.position )
				);
				curve.curveType = 'centripetal';
				curve.closed = true;

				const points = curve.getPoints( 50 );
				const line = new THREE.LineLoop(
					new THREE.BufferGeometry().setFromPoints( points ),
					new THREE.LineBasicMaterial( { color: 0x00ff00 } )
				);
				line.visible = false;
				scene.add( line );
				const texture = new THREE.TextureLoader().load(imgs[i]);
				texture.center.set(0.5,0.5);
				texture.rotation = 3.2;
				// immediately use the texture for material creation
				const material = new THREE.MeshBasicMaterial( { map: texture , side: THREE.DoubleSide} );
				const geometry = new THREE.BoxGeometry( 0.5, 0.5, 0.002 );				
				const objectToCurve = new THREE.Mesh( geometry, material );
				const flow = new Flow( objectToCurve );
				flow.updateCurve( 0, curve );
				scene.add( flow.object3D );
				flow.uniforms.pathOffset.value -= 0.1*i;
				flows.push(flow);
				//
}	
				
				//

				const light = new THREE.DirectionalLight( 0xffaa33 );
				light.position.set( - 10, 10, 10 );
				light.intensity = 1.0;
				scene.add( light );

				const light2 = new THREE.AmbientLight( 0x003973 );
				light2.intensity = 1.0;
				scene.add( light2 );

				//

				renderer = new THREE.WebGLRenderer( { antialias: true } );
				renderer.setPixelRatio( window.devicePixelRatio );
				renderer.setSize( window.innerWidth, window.innerHeight );
				renderer.domElement.addEventListener('mousedown', searchTarget, false);
				document.body.appendChild( renderer.domElement );			

				stats = new Stats();
				document.body.appendChild( stats.dom );

				window.addEventListener( 'resize', onWindowResize );

			}

			function onWindowResize() {

				camera.aspect = window.innerWidth / window.innerHeight;
				camera.updateProjectionMatrix();

				renderer.setSize( window.innerWidth, window.innerHeight );

			}
			function searchTarget(event){
				mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
				mouse.y = - (event.clientY / window.innerHeight) * 2 + 1;
				raycaster.setFromCamera(mouse, camera);
				intersects = raycaster.intersectObjects(targets);
				if (intersects.length > 0){
				intersects[0].object.callback();
				// Use the intersected objects: 
				}
			}
			
			function animate() {
				requestAnimationFrame( animate );
				for ( let i = 0; i < flows.length; i ++ ) {
					if (flows[i] && speed > 0) {
						flows[i].moveAlongCurve( speed );
					}
				}
				speed = speed - 0.00003*(Math.floor(Math.random() * 6) + 1);
				render();
			}

			function render() {
				renderer.render( scene, camera );
				stats.update();
			}