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
        createGroupTitle(ele.value);
        createGroupLine();
    }
}

function createGroupTitle(name){
    var resultDisplay = document.getElementById("display");
    var div = document.createElement('div');
    div.setAttribute('class','result-title');
    var para = document.createElement("a");
    var text = document.createTextNode(name);
    para.appendChild(text);
    div.appendChild(para);
    resultDisplay.appendChild(div);
}

function createGroupLine(){
    var resultDisplay = document.getElementById("display");
    var div = document.createElement('div');
    div.setAttribute('class','result-line');
    resultDisplay.appendChild(div);
}