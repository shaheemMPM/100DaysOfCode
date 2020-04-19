var elements = $('.modal-overlay, .modal');

$('.thumb-img').click(function(e){
    elements.addClass('active');
    document.getElementById('modal-img').src = e.target.src;
    // console.log();
});

$('.close-modal').click(function(){
    elements.removeClass('active');
});