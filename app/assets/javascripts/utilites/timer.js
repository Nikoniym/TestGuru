document.addEventListener('turbolinks:load', function () {
  var obj = document.getElementById('my_timer')
  var time = obj.getAttribute('data-timer')

  function timer() {
    var date = new Date(null)
    date.setSeconds(time)
    obj.innerHTML = date.toISOString().substr(11, 8)
    time --

    if(time <= 0){
      document.querySelector('form').submit();
      setTimeout(function(){},1000);
    }
    else{setTimeout(timer,1000);}
  }
  setTimeout(timer,1000);
});




