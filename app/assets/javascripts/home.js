$(document).ready(function(){
  $('.main-header').owlCarousel({
    items: 1,
    loop: true,
    center: true,
    autoplay: true,
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    nav: false,
    dots: false
  });

  $('.promos').owlCarousel({
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    margin: 30,
    responsiveClass:true,
    nav: false,
    dots: false,
    autoplay: true,
    loop: true,
    responsive:{
      0:{
        items:1
      },
      480:{
        items:2
      },
      992:{
        items:3
      }
    }
  });
});

function initMap() {
  var uluru = {lat: -34.589859, lng: -58.432122};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: uluru
  });

  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}
