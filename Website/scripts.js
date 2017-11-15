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
    if(document.getElementById(name)==null){
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

window.onClick = function(event){
    sign = document.getElementById('signup');
    info = document.getElementById('info');
    log = document.getElementById('login');
    if(event.target == sign || event.target == log || event.target == info){
        sign.style.display = 'none';
        log.style.display = 'none';
        info.style.display = 'none';
        document.getElementById('blurable').className = "unblur"; 
    }
}

function reloadPage(){
    window.location.reload();
}