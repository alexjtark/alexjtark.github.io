solomission.js


function playGame() {
confirm("Here comes the pitch! Will you swing?")
var swing
 pitch = (Math.floor(Math.random() * 3));
 distance = (Math.floor(Math.random() * 400));
if (pitch >= 1)
  caught = (Math.floor(Math.random() * 2));
  if (caught >= 1)
  alert("Its a Hit! Your ball was hit " + distance + " feet")
else if (caught = 1)
  alert("Fielder caught the ball, you are out!");
 if
   (distance >= 300)
   alert("Home Run! Your ball went " + distance + " feet")
else
  if (pitch = 0)
  alert("Strike!");
};