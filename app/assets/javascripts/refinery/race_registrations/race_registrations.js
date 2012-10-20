$(function() {
    // TODO dry (admin)
    $('#person_registration_id').change(function() {
        var registration_id = $(this).val();
        $.ajax({
            url: '/race_registrations/registrations/' + registration_id + '/categories',
            type: 'GET',
            dataType: 'JSON',
            success: function(json){

                var html = "<option value=\"\"></option>";

                $.each(json, function() {
                    html += "<option value=\"" + this.id + "\">" + this.title + "</option>";

                });
                $('#person_category_id').html(html);
            }
        });
    });

    $('#flash').css({
        'opacity': 0,
        'visibility':'visible'
    }).animate({'opacity': '1'}, 550);

    $('#flash_close').live('click', function(e) {
        try {
            $('#flash').animate({
                'opacity': 0,
                'visibility': 'hidden'
            }, 330, function() {
                $('#flash').hide();
            });
        } catch(ex) {
            $('#flash').hide();
        }
        e.preventDefault();
    });

});