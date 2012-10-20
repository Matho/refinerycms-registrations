$(function() {
    $("#race_registrations_people").on("click", "th a, .pagination a", function() {
        $.getScript(this.href);

        if (history && history.pushState) {
            history.pushState(null,"",this.href);
        }

        return false;
    });

    $("#people_search_form #search").keyup(function() {
        $.get($("#people_search_form").attr("action"), $("#people_search_form").serialize(), null, "script");

        if (history && history.pushState) {
            history.replaceState(null, document.title, $('#people_search_form').attr('action') + "?" + $('#people_search_form').serialize());
        }
        return false;
    });

    $("#person_registration_ids").change(function() {
        // TODO DRY
        $.get($("#people_search_form").attr("action"), $("#people_search_form").serialize(), null, "script");

        if (history && history.pushState) {
            history.replaceState(null, document.title, $('#people_search_form').attr('action') + "?" + $('#people_search_form').serialize());
        }
        return false;
    });

    // for people/_form file,
    // If user choose another registration by changing selectbox value, then categories for new selected registration are loaded

    $('#person_registration_id').change(function() {
        var registration_id = $(this).val();
        $.ajax({
            url: '/refinery/race_registrations/registrations/' + registration_id + '/categories',
            type: 'GET',
            dataType: 'JSON',
            success: function(json){
                var html = "<option value=\"\"></option>";

                $.each(json, function() {
                    html += "<option value=\"" + this.id + "\">" + this.title + "</option>";

                });

                $('#person_category_id').html(html).trigger("liszt:updated");
            }
        });
    });

});