addEventListener('turbolinks:load', function(){
  var bar = document.getElementById('Bar')
  if (bar){ move(parseInt(bar.dataset.progress)) }
})

function move(progress) {
  var i = 0;
  if (i == 0) {
    i = 1;
    var elem = document.getElementById("Bar");
    var width = 10;
    var id = setInterval(frame, 0);
    function frame() {
      if (width >= progress) {
        clearInterval(id);
        i = 0;
      } else {
        width++;
        elem.style.width = width + "%";
      }
    }
  }
}