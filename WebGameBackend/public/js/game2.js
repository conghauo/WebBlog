import * as THREE from "../js/build/three.module.js";
import { TransformControls } from "../js/jsm/controls/TransformControls.js";
import { Flow } from "../js/jsm/modifiers/CurveModifier.js";
import { TextGeometry } from "../js/jsm/geometries/TextGeometry.js";
import { OrbitControls } from "../js/jsm/controls/OrbitControls.js";
import {WebsocketController} from './websocket-controller.js';

//import Stats from "../js/jsm/libs/stats.module.js";
const ACTION_SELECT = 1,
    ACTION_NONE = 0;

const mouse = new THREE.Vector2();
//let stats;
let objectToCurve;
let scene, camera, renderer, action;
var raycaster = new THREE.Raycaster(),
    intersects;

var targets = [];
// use 21 imgages
var imgs = [];
var cards = [
    { x: -3.3, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: -2.2, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: -1.1, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: 0, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: 1, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: 2, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: 3, y: 0, z: -1.2, move: false, object: new THREE.Mesh() },
    { x: -3.3, y: 0, z: 0, move: false, object: new THREE.Mesh() },
    { x: -2.2, y: 0, z: 0, move: false, object: new THREE.Mesh() },
    { x: -1.1, y: 0, z: 0, move: false, object: new THREE.Mesh() },
   // { x: 0, y: 0, z: 0, move: false, object: new THREE.Mesh() },
    { x: 1, y: 0, z: 0, move: false, object: new THREE.Mesh() },
    { x: 2, y: 0, z: 0, move: false, object: new THREE.Mesh() },
    { x: 3, y: 0, z: 0, move: false, object: new THREE.Mesh() },
    { x: -3.3, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
    { x: -2.2, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
    { x: -1.1, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
    { x: 0, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
    { x: 1, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
    { x: 2, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
    { x: 3, y: 0, z: 1.2, move: false, object: new THREE.Mesh() },
];
var bplay = false;
await init();
animate();

async function getListFile(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();

    let jsOj = JSON.parse(myText);
    return jsOj.files;
}

function shuffleCards(size) {
   console.log(size);
    for (let i = size - 1; i > 0; i--) {
        let j = Math.floor(Math.random() * (size - 1));
        while (i == j) {
            j = Math.floor(Math.random() * (size - 1));
        }
        let temp = new THREE.Vector3(cards[i].x, cards[i].y, cards[i].z);
        cards[i].x = cards[j].x;
        cards[i].y = cards[j].y;
        cards[i].z = cards[j].z;
        cards[j].x = temp.x;
        cards[j].y = temp.y;
        cards[j].z = temp.z;
    }
    return cards;
}

function shuffle(array) {
    for (let i = array.length - 1; i > 0; i--) {
        let j = Math.floor(Math.random() * (i + 1));
        let temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
    return array;
}

async function init() {
	const response = await fetch("http://"+ window.location.hostname + "/api/getUser", {
	    method: 'get',
	    headers: {
	    'Accept': 'application/json'
	   	}
	});
	var userName = "";
	await response.json().then(data => {
          userName = data.username;
	});
	
	const websocket = new WebsocketController( "ws://" +window.location.hostname+ "/ws", "Game1", userName);
	
    var used = "../img/Game2/Lv1/listFiles.json";
    var imgPath = "../img/Game2/Lv1/";
    const params = new URLSearchParams(window.location.search);

    if (params.get("level") == "2") {
        used = "../img/Game2/Lv2/listFiles.json";
        imgPath = "../img/Game2/Lv2/";
    }
    if (params.get("level") == "3") {
        used = "../img/Game2/Lv3/listFiles.json";
        imgPath = "../img/Game2/Lv3/";
    }
    imgs = await getListFile(used);
    imgs = shuffle(imgs);
    scene = new THREE.Scene();

    camera = new THREE.PerspectiveCamera(
        40,
        window.innerWidth / window.innerHeight,
        1,
        1000
    );
    camera.position.set(0, 6, 0);
    camera.rotation.set(0, 0, 0);
    camera.lookAt(0, 0, 0);
    camera.updateMatrixWorld();

    var imgBg = "../img/backgoundgame.png";
    var txtBg = new THREE.TextureLoader().load(imgBg);
    const geoBg = new THREE.PlaneGeometry(5, 10);
    const materialBg = new THREE.MeshBasicMaterial({
        map: txtBg,
        side: THREE.DoubleSide,
    });
    const Bg = new THREE.Mesh(geoBg, materialBg);
    scene.background = txtBg;

    var imgPlay = "../img/play.png";
    var txtPlay = new THREE.TextureLoader().load(imgPlay);
    const geoPlay = new THREE.BoxGeometry(0.5, 0.01, 0.25);
    const materialPlay = new THREE.MeshBasicMaterial({
        map: txtPlay,
        side: THREE.DoubleSide,
    });

    let count = imgs.length;
    if (imgs.length > 21) count = 21;

    const play = new THREE.Mesh(geoPlay, materialPlay);
    play.position.set(-1.3, 0, 2);
    play.rotation.set(0, 0, 0);
    play.callback = function () {
        shuffleCards(count);
        this.visible = false;
        bplay = true;
        for (const card of cards) {
            card.move = true;
        }
		websocket.joinRoom();
    };
    targets.push(play);
    scene.add(play);

    var imgBackFace = "../img/Game2/back_face.jpg";
    var txtBackFace = new THREE.TextureLoader().load(imgBackFace);
    const geometry = new THREE.BoxGeometry(0.7, 0.01, 1);
    
    var audio = new Audio("../audio/Kuo.m4a");

    for (let i = 0; i < count; i++) {
        const card = cards[i];
        var img1 = imgs[i];
		 var texture1 = new THREE.TextureLoader().load(imgPath + img1);
		var materials = [];
    materials.push(
        new THREE.MeshBasicMaterial({
            map: txtBackFace,
            side: THREE.DoubleSide,
        })
    );
    materials.push(
        new THREE.MeshBasicMaterial({
            map: txtBackFace,
            side: THREE.DoubleSide,
        })
    );
    // texture1
    materials.push(
        new THREE.MeshBasicMaterial({
            map: texture1,
            side: THREE.DoubleSide,
        })
    );
    materials.push(
        new THREE.MeshBasicMaterial({
            map: txtBackFace,
            side: THREE.DoubleSide,
        })
    );
    materials.push(
        new THREE.MeshBasicMaterial({
            map: txtBackFace,
            side: THREE.DoubleSide,
        })
    );
    materials.push(
        new THREE.MeshBasicMaterial({
            map: txtBackFace,
            side: THREE.DoubleSide,
        })
    );
       
        card.object = new THREE.Mesh(geometry, materials);
        card.object.position.set(card.x, card.y, card.z);
        card.object.rotation.set(0, 0, 0);
        card.object.callback = function () {
            bplay = false;
            audio.play();
            card.object.rotation.z = 6;
            card.move = !card.move;
        };
        targets.push(card.object);
        scene.add(card.object);
    }

    renderer = new THREE.WebGLRenderer();
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);
    renderer.domElement.addEventListener("mousedown", searchTarget, false);
    document.addEventListener("touchend", onKeyDown, false);

    //renderer.domElement.addEventListener( 'mousedown', onPointerDown );
    const controls = new OrbitControls(camera, renderer.domElement);
    // to disable rotation
    controls.enableRotate = false;

   //stats = new Stats();
   //document.body.appendChild(stats.dom);
    window.addEventListener("resize", onWindowResize);
}

function onKeyDown(event) {
    const step = 0.5; // world units
    //switch ( event.keyCode ) {
    //case 37:
    //camera.position.x -= step;
    //break;
    //case 39:
    //camera.position.x += step;
    //break;
    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
    if (mouse.x > 0) {
        camera.position.x -= step;
    }
    if (mouse.x < 0) {
        camera.position.x += step;
    }
}
function onPointerDown(event) {
    action = ACTION_SELECT;
    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
    mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
    camera.position.x = lerp(camera.position.x, mouse.x, 0.3);
    camera.position.z = lerp(camera.position.z, mouse.y, 0.3);
}
function searchTarget(event) {
    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
    mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
    raycaster.setFromCamera(mouse, camera);
    intersects = raycaster.intersectObjects(targets);

    if (intersects.length > 0) {
        intersects[0].object.callback();
    }
}

function onWindowResize() {
    // Update renderer
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

    // Update camera
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
}
//function ease(t) { return t<0.5 ? 2*t*t : -1+(4-2*t)*t}

// linear interpolation function
function lerp(a, b, t) {
    return a + (b - a) * t;
}
var t = 0.05;
function moveTo0(card) {
    if (!card.move) return;
    const start = new THREE.Vector3(
        card.object.position.x,
        card.object.position.y,
        card.object.position.z
    );
    const end = new THREE.Vector3(0, 0, 0);
    const newX = lerp(start.x, end.x, t); // interpolate between a and b where
    const newY = lerp(start.y, end.y, t); // t is first passed through a easing
    const newZ = lerp(start.z, end.z, t); // function in this example.
    const newPos = new THREE.Vector3(newX, newY, newZ);
    if (isNaN(newX)) return;
    if (Math.abs(newX) < 0.00001 && Math.abs(newZ) < 0.00001) {
        if (bplay == true) {
            card.move = false;
            card.object.rotation.z = 3;
        } else card.object.rotation.z = 6;
        return;
    }
    card.object.position.set(newX, newY, newZ); // set new position
    card.object.rotation.z += t;
}
function moveBack(card) {
    if (card.move) return;
    const start = new THREE.Vector3(
        card.object.position.x,
        card.object.position.y,
        card.object.position.z
    );
    const end = new THREE.Vector3(card.x, card.y, card.z);
    const newX = lerp(start.x, end.x, t); // interpolate between a and b where
    const newY = lerp(start.y, end.y, t); // t is first passed through a easing
    const newZ = lerp(start.z, end.z, t); // function in this example.
    const newPos = new THREE.Vector3(newX, newY, newZ);
    if (isNaN(newX)) return;
    if (Math.abs(newX) < 0.00001 && Math.abs(newZ) < 0.00001) {
        return;
    }
    card.object.position.set(newX, newY, newZ); // set new position
}

function animate() {
    requestAnimationFrame(animate);
    render();
    //objectToCurve.rotation.z += 0.02;
    for (const card of cards) {
        moveTo0(card);
        moveBack(card);
    }
}

function render() {
    renderer.render(scene, camera);
    stats.update();
}
