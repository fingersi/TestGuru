document.addEventListener('turbolinks:load', function(){
  var endtime = document.getElementById('time_left');
  if (endtime){
    endtime.classList.add('hide')
    initializeClock('clockdiv');
  };
})

function getTimeRemaining(endtime) {
  const total = Date.parse(endtime) - Date.parse(new Date());
  const seconds = Math.floor((total / 1000) % 60);
  const minutes = Math.floor((total / 1000 / 60) % 60);
  return {
    total,
    minutes,
    seconds,
  };
}

function initializeClock(id) {
  const endtime = document.getElementById("time_left");
  if(endtime) {
    const innerEndtime = endtime.innerHTML
    const clock = document.getElementById(id);
    const minutesSpan = clock.querySelector(".minutes");
    const secondsSpan = clock.querySelector(".seconds");

    function updateClock() {
      const t = getTimeRemaining(innerEndtime);

      if(t.total <= 0){
        location.href = ("http://" + window.location.host + endtime.dataset.result);
      }

      minutesSpan.innerHTML = ("0" + t.minutes).slice(-2);
      secondsSpan.innerHTML = ("0" + t.seconds).slice(-2);

      if (t.total <= 0) {
        clearInterval(timeinterval);
      }
    }

    updateClock();
    const timeinterval = setInterval(updateClock, 1000);
  }
}

 export { initializeClock };