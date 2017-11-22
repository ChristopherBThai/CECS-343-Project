/* Javascript for the searching functions */
/* Search function that will call search.php */
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

		xmlhttp.open("GET","php/search.php?q="+ele.value,true);
		xmlhttp.send();

    }
}

/* One function to display all three components of a result */
function result(group,name){
    createGroupTitle(group);
    createGroupLine(group);
    createResult(group,name);

}

/* Creates a title for the grouptype */
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

/* Creates a line below the grouptype name */
function createGroupLine(groupName){
	if(document.getElementById("line"+groupName)==null){
    	var resultDisplay = document.getElementById(groupName);
    	var div = document.createElement('div');
   		div.setAttribute('class','result-line');
		div.setAttribute('id',"line"+groupName);
    	resultDisplay.appendChild(div);
	}
}

/* Creates the results and catagorizes them */
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

/* Displays "0 Results found" */
function noResults(){
	document.getElementById("display").innerHTML = '<p class="noResults"><br>0 results found</p>';
}

/* Reset timers for result animations */
function resetTimers(){
    timers = {};
}