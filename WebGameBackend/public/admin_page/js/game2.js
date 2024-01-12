"use strict";
async function imgAdd (sex, object) {
    object
    .closest(".row")
    .find(".imgAdd")
    .before(
      '<div class="col-sm-2 imgUp"><div class="imagePreview ' + sex + '-' + imgsLv1.length  +'"></div><label class="btn btn-primary btn-upload '+ sex + '">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    );
};
$(".imgAddLv1").click(async function () {
   await imgAdd('Lv1', $(this));
});

$(".imgAddLv2").click(async function () {
   await imgAdd('Lv2',$(this));
});
$(".imgAddLv3").click(async function () {
   await imgAdd('Lv3',$(this));
});

$(document).on("click", "i.del", async function () {
  // 	to remove card
  let arrClass = $(this).parent().children('div').attr('class').split(/\s+/);
  let key = arrClass[1];
  let pathImage = mapIdImg[key].replace("../","");
  console.log( mapIdImg[key] );
  let data = new FormData();
        data.append('pathImage', pathImage );
         const response = await fetch("http://"+ window.location.hostname + "/api/delete-image", {
            method: 'POST',
            headers: {
            'Accept': 'application/json'
                },
            body: data
        });
   console.log(await response);
   delete mapIdImg[key];
  $(this).parent().remove();
  
  // to clear image
  // $(this).parent().find('.imagePreview').css("background-image","url('')");
});
$(function () {
  $(document).on("change", ".uploadFile", async function () {
    var uploadFile = $(this);
    var files = !!this.files ? this.files : [];
    if (!files.length || !window.FileReader) return; // no file selected, or no FileReader support
    console.log($(this).parent());
    let arrClass = $(this).parent().attr('class').split(/\s+/);
    let sex = arrClass[arrClass.length -1];
    console.log(sex);
    if (/^image/.test(files[0].type)) { 
	let data = new FormData();
	data.append('image', files[0]);
	data.append('pathStore', "/img/Game2/" + sex +"/" );
	console.log($(this).parent()); 	
	 const response = await fetch("http://"+ window.location.hostname + "/api/image", {
	    method: 'POST',
	    headers: {
	    'Accept': 'application/json'
	   	},
	    body: data
	});
	var url = "";
	await response.json().then(data => {
          url = data.image;
	});
    
        // set image data as background of div
        //alert(uploadFile.closest(".upimage").find('.imagePreview').length);
        uploadFile
          .closest(".imgUp")
          .find(".imagePreview")
          .css("background-image", "url(.." + url + ")");
    }
  });
});

var imgsLv1 = [];
var imgsLv2 = [];
var imgsLv3 = [];
var mapIdImg = {};
await init();

async function getListFile(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();
    let jsOj = JSON.parse(myText);
    return jsOj.files;
}
async function init() {
	imgsLv1 = await getListFile("../img/Game2/Lv1/listFiles.json");
	imgsLv2 = await getListFile("../img/Game2/Lv2/listFiles.json");
	imgsLv3 = await getListFile("../img/Game2/Lv3/listFiles.json");
}

$(".loadSourceLv1").click(function( ){
    for (let i = 0; i < imgsLv1.length ; i++) {    
    let url =  "../img/Game2/Lv1/" + imgsLv1[i]  ;   
    mapIdImg['Lv1-'+i] = url;
    $(".imgAddLv1")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview Lv1-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".Lv1-"+i).css("background-image", "url('"+ url +"')");
    }
});


$(".loadSourceLv2").click(function( ){
    for (let i = 0; i < imgsLv2.length ; i++) {    
    let url =  "../img/Game2/Lv2/" + imgsLv2[i]  ;   
    mapIdImg['Lv2-'+i] = url;
    $(".imgAddLv2")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview Lv2-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".Lv2-"+i).css("background-image", "url('"+ url +"')");
    }
});

$(".loadSourceLv3").click(function( ){
    for (let i = 0; i < imgsLv3.length ; i++) {    
    let url =  "../img/Game2/Lv3/" + imgsLv3[i]  ;   
    mapIdImg['Lv3-'+i] = url;
    $(".imgAddLv3")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview Lv3-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".Lv3-"+i).css("background-image", "url('"+ url +"')");
    }
});
