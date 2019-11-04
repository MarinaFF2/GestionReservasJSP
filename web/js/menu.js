$( document ).ready(function() {
    $('#menu_on').click(function(){ // Al hacer click...
       $('body').toggleClass('vertical').css({'visibility':'visibility'});
       $('body').toggleClass('horizontal').css({'visibility':'hidden'});
    });
});


