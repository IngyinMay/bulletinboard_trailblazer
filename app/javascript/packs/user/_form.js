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