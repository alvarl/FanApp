$(document).ready(function() {

});
var sliding = false;
function toggleKavaExtended(item, id)
{
    if(sliding)
        return;
    sliding = true;
    var ext = $(item).parent().find('.extended');
    var exti = ext.get(0);
    loaded = exti.loaded;
    if(!loaded)
    {
        ext.load('/Application/kava_ext', function(){
            $(this).slideDown(500, function(){
                sliding = false;
                $(this).get(0).loaded = true;
                $(this).get(0).shown = true;
            });
        });
    }
    else
    {
        shown = exti.shown;
        if(shown)
        {
            ext.slideUp(500, function(){
                sliding = false;
            });
            exti.shown = false;
        }
        else
        {
            ext.slideDown(500, function(){
                sliding = false;
            });
            exti.shown = true;
        }
    }
}
