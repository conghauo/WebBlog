"use strict";
async function imgAdd (sex, object) {
    object
    .closest(".row")
    .find(".imgAdd")
    .before(
      '<div class="col-sm-2 imgUp"><div class="imagePreview ' + sex + '-' + imgsGay.length  +'"></div><label class="btn btn-primary btn-upload '+ sex + '">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    );
};
$(".imgAddGay").click(async function () {
   await imgAdd('Gay', $(this));
});

$(".imgAddLes").click(async function () {
   await imgAdd('Les',$(this));
});
$(".imgAddNormal").click(async function () {
   await imgAdd('Normal',$(this));
});
$(".imgAdd3Some").click(async function () {
   await imgAdd('3Some',$(this));
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
	data.append('pathStore', "/img/Game1/" + sex +"/" );
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

var imgsGay = [];
var imgsLes = [];
var imgsNormal = [];
var imgs3Some = [];
var mapIdImg = {};
await init();

async function getListFile(file) {
    let myObject = await fetch(file);
    let myText = await myObject.text();
    let jsOj = JSON.parse(myText);
    return jsOj.files;
}
async function init() {
	imgsGay = await getListFile("../img/Game1/Gay/listFiles.json");
	imgsLes = await getListFile("../img/Game1/Les/listFiles.json");
	imgsNormal = await getListFile("../img/Game1/Normal/listFiles.json");
	imgs3Some = await getListFile("../img/Game1/3Some/listFiles.json");
}

$(".loadSourceGay").click(function( ){
    for (let i = 0; i < imgsGay.length ; i++) {    
    let url =  "../img/Game1/Gay/" + imgsGay[i]  ;   
    mapIdImg['Gay-'+i] = url;
    $(".imgAddGay")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview Gay-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".Gay-"+i).css("background-image", "url('"+ url +"')");
    }
});


$(".loadSourceLes").click(function( ){
    for (let i = 0; i < imgsLes.length ; i++) {    
    let url =  "../img/Game1/Les/" + imgsLes[i]  ;   
    mapIdImg['Les-'+i] = url;
    $(".imgAddLes")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview Les-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".Les-"+i).css("background-image", "url('"+ url +"')");
    }
});

$(".loadSourceNormal").click(function( ){
    for (let i = 0; i < imgsNormal.length ; i++) {    
    let url =  "../img/Game1/Normal/" + imgsNormal[i]  ;   
    mapIdImg['Normal-'+i] = url;
    $(".imgAddNormal")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview Normal-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".Normal-"+i).css("background-image", "url('"+ url +"')");
    }
});

$(".loadSource3Some").click(function( ){
    for (let i = 0; i < imgs3Some.length ; i++) {    
    let url =  "../img/Game1/imgs3Some/" + imgs3Some[i]  ;   
    mapIdImg['imgs3Some-'+i] = url;
    $(".imgAdd3Some")
    .before(
      '<div class="col-sm-2 imgUp"><div  class="imagePreview 3Some-' + i +' "></div><label class="btn btn-primary btn-upload">Upload<input type="file" class="uploadFile img" value="Upload Photo" style="width:0px;height:0px;overflow:hidden;"></label><i class="fa fa-times del"></i></div>'
    )
   $(".3Some-"+i).css("background-image", "url('"+ url +"')");
    }
});
