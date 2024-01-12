"use strict";
	 // $(function(){
      // bind change event to select
	     $('#select-game2').on('change', function () {
			var value =  $(this).val(); // get selected value
			if (value == 0)
				  document.getElementById("link-game2").href="/game2?level=1"; 
			if (value == 1)
				  document.getElementById("link-game2").href="/game2?level=1"; 
			if (value == 2)
				  document.getElementById("link-game2").href="/game2?level=2"; 
			if (value == 3)
				  document.getElementById("link-game2").href="/game2?level=3"; 
		 });
	 // });
      // $(function(){
      // bind change event to select
	  $('#select-game1').on('change', function () {
          	  var value =  $(this).val(); // get selected value
		  console.log(value);
  
		  if (value == 0)
				  document.getElementById("link-game1").href="/game1"; 
			if (value == 1)
				  document.getElementById("link-game1").href="/game1?sex=gay"; 
			if (value == 2)
				  document.getElementById("link-game1").href="/game1?sex=les"; 
			if (value == 3)
				  document.getElementById("link-game1").href="/game1";
		    if (value == 4)
				  document.getElementById("link-game1").href="/game1?sex=3Some"; 
		 });
//  });
	 await init();
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
	
	 document.getElementById("username").textContent = userName;
	 document.getElementById("Avatar").textContent  = userName.charAt(0);
	 document.getElementById("hasIcon").href = "/forum/u/"+userName;
	
	const reCredits = await fetch("http://"+ window.location.hostname + "/api/getCredits", {
            method: 'get',
            headers: {
            'Accept': 'application/json'
                }
        });
        var credits = {};
        await reCredits.json().then(data => {
          credits = data;
        });
	console.log(credits);
	let mins = credits.mins;
	let seconds = credits.seconds;
	document.getElementById("Times").textContent = mins + " mins " + seconds + " secs ";

	
}
window.showMenu = showMenu;
window.hideMenu = hideMenu;

function showMenu() {
console.log('show menu');
document.getElementById("app").classList.add('drawerOpen');
}

function hideMenu() {
console.log('hide menu');
document.getElementById("app").classList.remove('drawerOpen');
}
