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
