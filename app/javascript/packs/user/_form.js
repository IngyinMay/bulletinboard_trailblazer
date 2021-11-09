$('.super-user-flag').on('change', function () {
    if (this.value == 'true') {
        $('.user-role').attr('hidden', true);
    } else if (this.value == 'false') {
        $('.user-role').removeAttr('hidden');
    }
});

if ($(".super-user-flag:checked ").val() == 'false') {
    $('.user-role').removeAttr('hidden');
}

$('#user_profile').on('change', function(e) {
    var reader = new FileReader();
    reader.onload = function (event) {
        $('#img_prev')
            .attr('src', event.target.result)
            .width('30%');
    };
    reader.readAsDataURL(e.target.files[0]);
});
