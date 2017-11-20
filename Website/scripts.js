/* jshint browser: true */
/* eslint-env browser */
/* eslint no-unused-vars:0 */
/* eslint no-unused-vars: "error" */

function search(ele){
    if(event.keyCode==13){
        
		document.getElementById("display").innerHTML = "";

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
				$('#phpScripts').append(xmlhttp.responseText);
			}
		};

		xmlhttp.open("GET","search.php?q="+ele.value,true);
		xmlhttp.send();

    }
}

function result(group,name){
    createGroupTitle(group);
    createGroupLine(group);
    createResult(group,name);

}


function createGroupTitle(name){
	if(document.getElementById(name)==null){
		var resultDisplay = document.getElementById("display");

		var divOuter = document.createElement('div');
		divOuter.setAttribute('id',name);

		var div = document.createElement('div');
		div.setAttribute('class','result-title');
		var para = document.createElement("a");
		var text = document.createTextNode(name);

		para.appendChild(text);
		div.appendChild(para);
		divOuter.appendChild(div);
		resultDisplay.appendChild(divOuter);
	}
}

function createGroupLine(groupName){
	if(document.getElementById("line"+groupName)==null){
    	var resultDisplay = document.getElementById(groupName);
    	var div = document.createElement('div');
   		div.setAttribute('class','result-line');
		div.setAttribute('id',"line"+groupName);
    	resultDisplay.appendChild(div);
	}
}

var timers = {};

function createResult(groupName,name){
	var x = document.getElementById(name);
    if(x==null || x.parentNode!=document.getElementById("buttons"+groupName)){
        var div = document.getElementById("buttons"+groupName);
    	if(div==null){
		    var resultDisplay = document.getElementById(groupName);
	    	var divOuter = document.createElement('div');
	    	divOuter.setAttribute('class',"result-box-padding");
	    	div = document.createElement('div');
	       	div.setAttribute('class',"result-box");
		    div.setAttribute('id',"buttons"+groupName);
		    resultDisplay.appendChild(divOuter);
		    divOuter.appendChild(div);
	    }
	    var button = document.createElement('button');
	    button.setAttribute('onClick',"showInfo(this)");
        button.setAttribute('id',name);
        if(groupName in timers){
            button.setAttribute('style',"animation-delay: "+timers[groupName]+"s;");
            timers[groupName] += .1;
        }else{
            timers[groupName] = 0;
        }
	    var text = document.createTextNode(name);
	    button.appendChild(text);
	    div.appendChild(button);
    }
}

function noResults(){
	document.getElementById("display").innerHTML = '<p class="noResults"><br>0 results found</p>';
}

function resetTimers(){
    timers = {};
}

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

	xmlhttp.open("GET","info.php?q="+ele.id,true);
	xmlhttp.send();
    
    document.getElementById('info').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

function removeInfo(){
    document.getElementById('info').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}

function showLogin(){
    document.getElementById('login').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

function removeLogin(){
    document.getElementById('login').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}

function showSignup(){
    document.getElementById('signup').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

function removeSignup(){
    document.getElementById('signup').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}


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

function reloadPage(){
    window.location.reload();
}
