function addReview(name,date,rev,stars){
    container = document.getElementById("reviews");
    review = document.createElement('div');
    review.innerHTML = "<div><p><b>"+name+"</b><a style='float:right;'>"+date+"</a></p><div style='padding: 0px 30px 0px 30px'><p>\""+rev+"\"</p></div><p style='padding-bottom: 23px'><a style='float:right;'>"+stars+"/5 stars</a></p><hr style='opacity: .4;width: 80%;margin-top: 30px;margin-bottom: 30px'></div>";
    container.appendChild(review);
}

function noReviews(){
    document.getElementById("reviews").innerHTML="<p style='text-align:center;'>No Reviews</p>";
}

function resetReviews(){
    document.getElementById("reviews").innerHTML="";
}

function setInfo(name,num,mail,id){
    document.getElementById("infoLoc").innerHTML = "<p><img src='pictures/"+id+".jpg' class='infoimage'><br><b id='infoName' style='font-size:150%;'>"+name+"</b></p><p><b>Phone Number: </b><a id='infoPhone' href='#' >"+num+"</a></p><p><b>E-mail: </b><a id='infoEmail' href='#' >"+mail+"</a></p><br>";
}

function setAvg(avg){
    document.getElementById("reviewtitle").innerHTML = "<a style='float:right;'>"+avg+"/5 Rating</a><b>Reviews</b>";
}

function resetAvg(){
    document.getElementById("reviewtitle").innerHTML = "<b>Reviews</b>";
}

function createReviewBox(){
    text = document.getElementById("reviewtext");
    button = document.getElementById("reviewbutton");
    star = document.getElementById("starrating");
    star.setAttribute("class","stars starrating starrating_animate");
    text.setAttribute("class","reviewtext reviewtext_animate");
    button.setAttribute("class","formButton reviewbtn reviewbtn_animate");
    button.setAttribute("onClick","submitReview();");
    button.innerHTML="Submit Review";
}

function resetReviewBox(){
    text = document.getElementById("reviewtext");
    button = document.getElementById("reviewbutton");
    star = document.getElementById("starrating");
    star.setAttribute("class","stars starrating");
    text.setAttribute("class","reviewtext");
    button.setAttribute("class","formButton reviewbtn");
    button.setAttribute("onClick","createReviewBox();");
    button.innerHTML="Write Review";
}

function submitReview(){
	text = document.getElementById("reviewtext").value;
	stars = "";
	if(document.getElementById("star-1").value=="on"){
		stars = 1;
	}else if(document.getElementById("star-2").checked=="on"){
		stars = 2;
	}else if(document.getElementById("star-3").checked=="on"){
		stars = 3;
	}else if(document.getElementById("star-4").checked=="on"){
		stars = 4;
	}else if(document.getElementById("star-5").checked=="on"){
		stars = 5;
	}else{
		return;
	}
	console.log(text);
	console.log(stars);

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
