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
    document.getElementById("infoLoc").innerHTML = "<p><img src='pictures/"+id+".jpg' class='infoimage'><b id='infoName' style='font-size:150%;'>"+name+"</b></p><p><b>Phone Number: </b><a id='infoPhone' href='#' >"+num+"</a></p><p><b>E-mail: </b><a id='infoEmail' href='#' >"+mail+"</a></p>";
}