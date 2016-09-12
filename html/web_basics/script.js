//image is a string
function addSnowQueenPicture (event) {
	var newImg = document.createElement("img");
	newImg.src = "snow_queen.jpg";
	event.target.appendChild(newImg);
}
function addSleepingBeautyPicture (event) {
	var newImg = document.createElement("img");
	newImg.src = "sleeping.jpg"
	event.target.appendChild(newImg);
}
function showRedRidingPic (event) { //how can this function make any hidden element work? using event.target?
	document.getElementById('riding-hood-pic').hidden = false;
}

firstFilm = document.getElementById('tsq')
secondFilm = document.getElementById('sb')
ridingPic = document.getElementById('riding-hood-pic')
ridingPic.hidden = true
thirdFilm = document.getElementById('lrrh')
firstFilm.addEventListener('click', addSnowQueenPicture)
secondFilm.addEventListener('click', addSleepingBeautyPicture)
thirdFilm.addEventListener('click', showRedRidingPic)

