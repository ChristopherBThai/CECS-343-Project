/* jshint browser: true */
/* eslint-env browser */
/* eslint no-unused-vars:0 */
/* eslint no-unused-vars: "error" */


function createText() {
    var text = document.createTextNode("Hello World");
    document.body.appendChild(text);
}

function search(ele){
    if(event.keyCode==13){
		var group = new Group(ele.value,new Array(0));
		group.list.push(new Result("TestName1","TestPhone","TestDesc"));
		group.list.push(new Result("TestName2","TestPhone","TestDesc"));
		group.list.push(new Result("TestName3","TestPhone","TestDesc"));
        createGroupTitle(group.name);
        createGroupLine(group.name);
		createResult(group.name,group.list[0]);
		createResult(group.name,group.list[1]);
		createResult(group.name,group.list[2]);
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
	var text = document.createTextNode(result.name);
	button.appendChild(text);
	div.appendChild(button);
}
