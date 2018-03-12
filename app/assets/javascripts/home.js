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

  $('.intro-owl').owlCarousel({
    responsive: {
      0:{
        items:2
      },
      768:{
        items:3
      },
      992:{
        items:4
      }
    },
    responsiveClass:true,
    nav: true,
    dots: false,
    autoplay: true,
    loop: true,
    navText: ['<i class="fa fa-angle-left" aria-hidden="true"></i>', '<i class="fa fa-angle-right" aria-hidden="true"></i>']
  });

  $('.video').parent().click(function () {
    if($(this).children(".video").get(0).paused){
      $(this).children(".video").get(0).play();
      $(this).children(".play").addClass('pause');
    }else{
      $(this).children(".video").get(0).pause();
      $(this).children(".pause").removeClass('pause');
    }
  });

  $('.video').on('ended',function(){
    $(this).parent().children(".play").removeClass('pause');
    $(this).get(0).currentTime = 0;
  });

  new WOW().init();

  $('.grid').masonry({
    itemSelector: '.grid-item', // use a separate class for itemSelector, other than .col-
    columnWidth: '.grid-sizer',
    percentPosition: true
  });
});

function initMap() {
  var uluru = {lat: -34.589960, lng: -58.432130};
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 18,
    center: uluru
  });

  var marker = new google.maps.Marker({
    position: uluru,
    map: map
  });
}
