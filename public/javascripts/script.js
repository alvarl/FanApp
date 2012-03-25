function slideNum99()
{
    $('.num99').animate({
        'top': '-100px'
    }, 1000);
    $('.num-user').animate({
        'top': '0'
    }, 1000);
}

function goToByScroll(id)
{
    $("html:not(:animated),body:not(:animated)").animate({scrollTop: $("#"+id).offset().top},'slow');
}