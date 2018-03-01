$(function(){
   $('.wallet-buttons a,td a').hover(function(){
       $(this).toggleClass('animated pulse');
   },function(){
       $(this).toggleClass('animated pulse'); 
   });
    
   $('.box img').hover(function(){
       $(this).toggleClass('animated rubberBand');
   },function(){
       $(this).toggleClass('animated rubberBand'); 
   });
});