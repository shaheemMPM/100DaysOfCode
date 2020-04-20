var elements = $('.modal-overlay, .modal');

$('.thumb-img').click(function(e){
    elements.addClass('active');
    document.getElementById('modal-img').src = e.target.src;
});

$('.thumb-vid').click(function(e){
    let elem;
    if (e.target.tagName.toLowerCase() === 'video') {
        elem = e.target;
    }else if (e.target.tagName.toLowerCase() === 'source') {
        elem = e.target.parentElement;
    }
    if (elem.requestFullscreen) {
        elem.requestFullscreen();
    } else if (elem.mozRequestFullScreen) { /* Firefox */
        elem.mozRequestFullScreen();
    } else if (elem.webkitRequestFullscreen) { /* Chrome, Safari & Opera */
        elem.webkitRequestFullscreen();
    } else if (elem.msRequestFullscreen) { /* IE/Edge */
        elem.msRequestFullscreen();
    }
});

$('.close-modal').click(function(){
    elements.removeClass('active');
});