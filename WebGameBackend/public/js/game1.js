import * as THREE from "../js/build/three.module.js";
import { TransformControls } from "../js/jsm/controls/TransformControls.js";
import { Flow } from "../js/jsm/modifiers/CurveModifier.js";
import { TextGeometry } from "../js/jsm/geometries/TextGeometry.js";
import { OrbitControls } from "../js/jsm/controls/OrbitControls.js";
import {WebsocketController} from './websocket-controller.js';

//import Stats from "../js/jsm/libs/stats.module.js";

//let stats;
const ACTION_SELECT = 1,
    ACTION_NONE = 0;
const flows = [];
const mouse = new THREE.Vector2();
//const count_img = 15;
let scene,
    camera,
    renderer,
    rayCaster,
    control,
    action = ACTION_NONE;
var raycaster = new THREE.Raycaster(),
    intersects;
var speed = 0;
// use 12 image
var imgs = [];
let play;
var targets = [];
await init();
animate();

async function getListFile(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();

    let jsOj = JSON.parse(myText);
    return jsOj.files;
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
	
	const websocket = new WebsocketController( "ws://" + window.location.hostname + "/ws", "Game1", userName);
	
    var used = "../img/Game1/Normal/listFiles.json";
    var imgPath = "../img/Game1/Normal/";
    const params = new URLSearchParams(window.location.search);

    if (params.get("sex") == "gay") {
        used = "../img/Game1/Gay/listFiles.json";
        imgPath = "../img/Game1/Gay/";
    }
    if (params.get("sex") == "les") {
        used = "../img/Game1/Les/listFiles.json";
        imgPath = "../img/Game1/les/";
    }
    if (params.get("sex") == "3Some") {
        used = "../img/Game1/3Some/listFiles.json";
        imgPath = "../img/Game1/3Some/";
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
    var audio = new Audio("../audio/xoayvong2.m4a");
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
    play = new THREE.Mesh(geoPlay, materialPlay);
    play.position.set(-1.3, 0, 2);
    play.rotation.set(0, 0, 0);
    play.callback = function () {
        speed = (Math.floor(Math.random() * 6) + 1) / 100;
        audio.play();
		websocket.joinRoom();
    };
    targets.push(play);
    scene.add(play);

    const cone = new THREE.ConeGeometry(0.25, 0.25, 2);
    const materialone = new THREE.MeshBasicMaterial({ color: 0x00ff00 });
    const m_cone = new THREE.Mesh(cone, materialone);
    m_cone.position.set(-1, 1, 0.9);
    m_cone.rotation.set(0, 0, 2);
    scene.add(m_cone);

    const initialPoints = [
        { x: -2, y: 2, z: 0 },
        { x: 2, y: 2, z: 0 },
        { x: 2, y: -2, z: 0 },
        { x: -2, y: -2, z: 0 },
    ];

    const boxGeometry = new THREE.BoxGeometry(0.1, 0.1, 0.1);
    const boxMaterial = new THREE.MeshBasicMaterial();
    let count = imgs.length;
    if (imgs.length > 11) count = 11;
    for (let i = 0; i < count; i++) {
        const curveHandles = [];
        for (const handlePos of initialPoints) {
            const handle = new THREE.Mesh(boxGeometry, boxMaterial);
            handle.visible = false;
            handle.position.copy(handlePos);
            curveHandles.push(handle);
            scene.add(handle);
        }
        //ar_curveHandles.push(curveHandles);
        const curve = new THREE.CatmullRomCurve3(
            curveHandles.map((handle) => handle.position)
        );
        curve.curveType = "centripetal";
        curve.closed = true;

        const points = curve.getPoints(50);
        const line = new THREE.LineLoop(
            new THREE.BufferGeometry().setFromPoints(points),
            new THREE.LineBasicMaterial({ color: 0x00ff00 })
        );
        line.visible = false;
        scene.add(line);
        const texture = new THREE.TextureLoader().load(imgPath + imgs[i]);
        texture.center.set(0.5, 0.5);
        // immediately use the texture for material creation

        const material = new THREE.MeshBasicMaterial({
            map: texture,
            wireframe: false,
            side: THREE.DoubleSide,
        });
        const geometry = new THREE.PlaneGeometry(1, 1);
        const objectToCurve = new THREE.Mesh(geometry, material);
        const flow = new Flow(objectToCurve);
        flow.updateCurve(0, curve);
        scene.add(flow.object3D);
        flow.uniforms.pathOffset.value -= 0.1 * i;
        flows.push(flow);
    }
    renderer = new THREE.WebGLRenderer();
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.domElement.addEventListener("mousedown", searchTarget, false);
    document.body.appendChild(renderer.domElement);
    const controls = new OrbitControls(camera, renderer.domElement);
    controls.enableRotate = false;

    //stats = new Stats();
    //document.body.appendChild(stats.dom);
    window.addEventListener("resize", onWindowResize);
}

function onWindowResize() {
    // Update renderer
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));

    // Update camera
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
}
function searchTarget(event) {
    mouse.x = (event.clientX / window.innerWidth) * 2 - 1;
    mouse.y = -(event.clientY / window.innerHeight) * 2 + 1;
    raycaster.setFromCamera(mouse, camera);
    intersects = raycaster.intersectObjects(targets);
    if (intersects.length > 0) {
        intersects[0].object.callback();
        // Use the intersected objects:
    }
}

function animate() {
    requestAnimationFrame(animate);
    for (let i = 0; i < flows.length; i++) {
        if (flows[i] && speed > 0) {
            flows[i].moveAlongCurve(speed);
        }
    }
    speed = speed - 0.00003 * (Math.floor(Math.random() * 6) + 1);
    render();
}

function render() {
    renderer.render(scene, camera);
   // stats.update();
}
