function setupCountDown()
{
  var auctionDateDomElement = $('#timer')
  if (auctionDateDomElement.length > 0) {
    var auctionDate = auctionDateDomElement.data('auction-date')
    var compareDate = new Date(Date.parse(auctionDate))

    var timer = setInterval(function() {
      timeBetweenDates(compareDate);
    }, 1000);
  }
}

function timeBetweenDates(toDate) {
  var dateEntered = toDate;
  var now = new Date();
  var difference = dateEntered.getTime() - now.getTime();

  if (difference <= 0) {
    // Timer done
    clearInterval(timer);

  } else {

    var seconds = Math.floor(difference / 1000);
    var minutes = Math.floor(seconds / 60);
    var hours = Math.floor(minutes / 60);
    var days = Math.floor(hours / 24);

    hours %= 24;
    minutes %= 60;
    seconds %= 60;

    $("#days").text(days);
    $("#hours").text(hours);
    $("#minutes").text(minutes);
    $("#seconds").text(seconds);
  }
}

$(document).ready(function() {
  setupCountDown();
=======
$(document).ready(function() {

  var timer;

  var compareDate = new Date();
  compareDate.setDate(compareDate.getDate() + 7); //just for this demo today + 7 days

  timer = setInterval(function() {
    timeBetweenDates(compareDate);
  }, 1000);

  function timeBetweenDates(toDate) {
    var dateEntered = toDate;
    var now = new Date();
    var difference = dateEntered.getTime() - now.getTime();

    if (difference <= 0) {

      // Timer done
      clearInterval(timer);

    } else {

      var seconds = Math.floor(difference / 1000);
      var minutes = Math.floor(seconds / 60);
      var hours = Math.floor(minutes / 60);
      var days = Math.floor(hours / 24);

      hours %= 24;
      minutes %= 60;
      seconds %= 60;

      $("#days").text(days);
      $("#hours").text(hours);
      $("#minutes").text(minutes);
      $("#seconds").text(seconds);
    }
  }

  $('body').on('click', '.favorite-item', function(event) {
    let favorited = $(this).hasClass('favorited')

    $(this).toggleClass('favorited')

    let itemid = $(this).data('item-id') // data-item-id="....."
    let auctionid = $(this).data('auction-id') // data-item-id="....."

    console.log(`clicked on a heart for home ${itemid}`)

    let url = favorited ? `/auctions/${auctionid}/items/${itemid}/unfavorite` : `/auctions/${auctionid}/items/${itemid}/favorite`

    $.ajax({
      method: 'POST',
      url: url,
      dataType: 'script'
    })
  })
})
