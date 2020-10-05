if ("/work_times/index.html.erb"){
  function time()
{
  let weeks = new Array("Sun","Mon","Thu","Wed","Thr","Fri","Sat");
  let now = new Date();
  let y = now.getFullYear();
  let mo = now.getMonth() + 1;
  let d = now.getDate();
  let w = weeks[now.getDay()];
  let h = now.getHours();
  let mi = now.getMinutes();
  let s = now.getSeconds();

  if (mo < 10) mo = "0" + mo;
  if (d < 10) d = "0" + d;
  if (mi < 10) mi = "0" + mi;
  if (s < 10) s = "0" + s;

  document.getElementById("clock-date").innerHTML = y + "/" + mo + "/" + d + " (" + w + ")";
  document.getElementById("clock-time").innerHTML = h + ":" + mi + ":" + s;
  document.getElementById("clock-frame")
}

window.addEventListener("load",time);

setInterval(time,1000);
}
