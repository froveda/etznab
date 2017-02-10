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

  $('.services').owlCarousel({
    animateOut: 'fadeOut',
    animateIn: 'fadeIn',
    loop: false,
    margin: 10,
    responsiveClass:true,
    nav: false,
    dots: true,
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
