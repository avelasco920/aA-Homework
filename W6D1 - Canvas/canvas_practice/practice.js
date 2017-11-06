document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('myCanvas');
  canvas.width = 500;
  canvas.height = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'rgb(255,0,255)';
  ctx.fillRect(10, 10, 55, 50);

  ctx.beginPath();
  ctx.arc(100, 100, 20, 0, 2*Math.PI, false);
  ctx.strokeStyle = "blue";
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = "gray";
  ctx.fill();

});
