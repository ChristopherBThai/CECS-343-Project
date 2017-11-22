/* Javascript that will run all the small scripts */
/* Loops the search bar */
function initBar(){
    initBar.timerPerChar = 90;
    initBar.timerPerDel= 40;
    initBar.begText = "Search for ";
    initBar.text = ["Gardener","Plumber","Computer Repair","Maid","Trainer","Home Repair"];
    initBar.loc = 0;
    initBar.bar = document.getElementById("search-bar");
    initBar.interval = setInterval(writeBar,initBar.timerPerChar);
}
function writeBar(){
    var current = initBar.bar.getAttribute("placeholder");
    var text = initBar.text[initBar.loc];
    if(current.length-initBar.begText.length<text.length){
        initBar.bar.setAttribute("placeholder",initBar.begText+text.substr(0,current.length-initBar.begText.length+1)+"");
    }else{
        clearInterval(initBar.interval);
        var t = setTimeout(function(){
            initBar.interval = setInterval(eraseBar,initBar.timerPerDel)
        },2000);
    }
}
function eraseBar(){
    var current = initBar.bar.getAttribute("placeholder");
    var text = initBar.text[initBar.loc];
    if(current.length-initBar.begText.length>0){
        initBar.bar.setAttribute("placeholder",initBar.begText+text.substr(0,current.length-initBar.begText.length-1)+"");
    }else{
        clearInterval(initBar.interval);
        var t = setTimeout(function(){
            initBar.loc = (initBar.loc+1)%initBar.text.length;
            initBar.bar.setAttribute("placeholder",initBar.begText);
            initBar.interval = setInterval(writeBar,initBar.timerPerChar)
        },1000);
    }
}

/* Calls info.php and display the business' info */
function showInfo(ele){

	//Sends AJAX request
	if(window.XMLHttpRequest){
		//For IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	}else{
		//For IE6, IE4
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.onreadystatechange = function(){
		if(this.readyState == 4 && this.status == 200){
			document.getElementById("infoLoc").innerHTML = this.responseText;
		}
	};

	xmlhttp.open("GET","php/info.php?q="+ele.id,true);
	xmlhttp.send();
    
    document.getElementById('info').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

/* Removes the info popup */
function removeInfo(){
    document.getElementById('info').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}

/* Shows the login popup */
function showLogin(){
    document.getElementById('login').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

/* Removes the login popup */
function removeLogin(){
    document.getElementById('login').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}

/* Shows the signup popup */
function showSignup(){
    document.getElementById('signup').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

/* Removes the signup popup */
function removeSignup(){
    document.getElementById('signup').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}

/* Adds event listeners to be able to click out of popups from anywhere on the screen */
function setPopupClose(){
	document.getElementById('signupcancel').addEventListener("click",function(){
		removeSignup();
	},false);
	document.getElementById('logincancel').addEventListener("click",function(){
		removeLogin();
	},false);
	document.getElementById('infocancel').addEventListener("click",function(){
		removeInfo();
	},false);

	document.getElementById('signupform').addEventListener("click",function(){
		event.stopPropagation();
	},false);
	document.getElementById('loginform').addEventListener("click",function(){
		event.stopPropagation();
	},false);
	document.getElementById('infoform').addEventListener("click",function(){
		event.stopPropagation();
	},false);

	document.getElementById('signup').addEventListener("click",function closeSignup(){
		document.getElementById('signup').style.display = 'none';
    	document.getElementById('blurable').className = "unblur"; 
		document.getElementById('signupbutton').setAttribute('class',"formButton");
		document.getElementById('signuppw').setAttribute('class',"psw");
		document.getElementById('loginpw').innerHTML = "";
	});
	document.getElementById('login').addEventListener("click",function closeLogin(){
		document.getElementById('login').style.display = 'none';
    	document.getElementById('blurable').className = "unblur"; 
		document.getElementById('loginbutton').setAttribute('class',"formButton");
		document.getElementById('loginpw').setAttribute('class',"psw");
		document.getElementById('loginpw').innerHTML = "Forgot <a href='#'>password?</a>"
	});
	document.getElementById('info').addEventListener("click",function closeInfo(){
		document.getElementById('info').style.display = 'none';
    	document.getElementById('blurable').className = "unblur"; 
	});
}

/* Makes the login/signup button run away since we did not implement it yet */
function setRunawayButton(){
	var sign = document.getElementById('signupbutton');
	var signt = document.getElementById('signuppw');
	sign.addEventListener("mouseover",function(){
		if(sign.className=="formButton"||sign.className=="formButton right"){
			sign.setAttribute('class',"formButton left");
		}else{
			sign.setAttribute('class',"formButton right");
		}
		if(signt.className=="psw"){
			signt.innerHTML = "Please don't touch the button";
			signt.setAttribute('class',"psw 1");
		}else if(signt.className=="psw 1"){
			signt.innerHTML = "Can you not follow directions???";
			signt.setAttribute('class',"psw 2");
		}else if(signt.className=="psw 2"){
			signt.innerHTML = "The button literally does nothing.";
			signt.setAttribute('class',"psw 3");
		}else if(signt.className=="psw 3"){
			signt.innerHTML = "We haven't implemted it.";
			signt.setAttribute('class',"psw 4");
		}

	});
	var log = document.getElementById('loginbutton');
	var logt = document.getElementById('loginpw');
	log.addEventListener("mouseover",function(){
		if(log.className=="formButton"||log.className=="formButton right"){
			log.setAttribute('class',"formButton left");
		}else{
			log.setAttribute('class',"formButton right");
		}
		if(logt.className=="psw"){
			logt.innerHTML = "Please don't touch the button";
			logt.setAttribute('class',"psw 1");
		}else if(logt.className=="psw 1"){
			logt.innerHTML = "Can you not follow directions???";
			logt.setAttribute('class',"psw 2");
		}else if(logt.className=="psw 2"){
			logt.innerHTML = "The button literally does nothing.";
			logt.setAttribute('class',"psw 3");
		}else if(logt.className=="psw 3"){
			logt.innerHTML = "We haven't implemted it.";
			logt.setAttribute('class',"psw 4");
		}
	});
}

/* Reloads the page */
function reloadPage(){
    window.location.reload();
}