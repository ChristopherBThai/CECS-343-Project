/* jshint browser: true */
/* eslint-env browser */
/* eslint no-unused-vars:0 */
/* eslint no-unused-vars: "error" */

function search(ele){
    if(event.keyCode==13){
		var group = new Group(ele.value,new Array(0));
        var rand = Math.floor(Math.random()*20)+1;
        for(i=1;i<=rand;i++){
    		group.list.push(new Result("TestName"+i,"TestPhone","TestDesc"));
        }
        createGroupTitle(group.name);
        createGroupLine(group.name);
        for(i=0;i<group.list.length;i++){
            createResult(group.name,group.list[i]);
        }
    }
}

class Group {
	constructor(name,list){
		this.list = list;
		this.name = name;
	}
}

class Result {
	constructor(name,phone,desc){
		this.name = name;
		this.phone = phone;
		this.desc = desc;
	}
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

function createGroupLine(name){
	if(document.getElementById("line"+name)==null){
    	var resultDisplay = document.getElementById(name);
    	var div = document.createElement('div');
   		div.setAttribute('class','result-line');
		div.setAttribute('id',"line"+name);
    	resultDisplay.appendChild(div);
	}
}

function createResult(name,result){
	var div = document.getElementById("buttons"+name);
	if(div==null){
		var resultDisplay = document.getElementById(name);
		var divOuter = document.createElement('div');
		divOuter.setAttribute('class',"result-box-padding");
		div = document.createElement('div');
		div.setAttribute('class',"result-box");
		div.setAttribute('id',"buttons"+name);
		resultDisplay.appendChild(divOuter);
		divOuter.appendChild(div);
	}
	var button = document.createElement('button');
	button.setAttribute('onClick',"showInfo()");
	var text = document.createTextNode(result.name);
	button.appendChild(text);
	div.appendChild(button);
}

function showLogin(){
    document.getElementById('login').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

function removeLogin(){
    document.getElementById('login').style.display='none';
    document.getElementById('blurable').className = "unblur"; 
}

function showInfo(){
    document.getElementById('info').style.display='block';
    document.getElementById('blurable').className = "blur"; 
}

function removeInfo(){
    document.getElementById('info').style.display='none';
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

