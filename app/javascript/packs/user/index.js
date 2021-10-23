var table = new DataTable('.user-list-table',{
    deferRender: true,
    dom: "<" +
    "<'user-list-option clearfix'" + "p>" +
    "<'user-search-option'<'user-search-left'f> <'user-search-right'Rl>>" +
    "<'user-row-count'>" +
    "<'relative'rt>" +
    "<'user-list-option'" + "p>" +
    ">",
    pageLength: 5,
    lengthMenu: [[5, 10, 25, 50, 100], [5, 10, 25, 50, 100]],
    drawCallback: function () {
        $("#table_count").html("User Count&nbsp;&nbsp;<strong>" + this.api().rows({search: 'applied'}).count() + "</strong>" );
    },
    rowCallback: function (row, data, index) {
        $(row).addClass('user-visitor-line');
    },
    stateSave: true,
});
// append
$(".dataTables_paginate").removeClass().addClass("user-list-option-right");
$(".user-list-container").append($(".user-list-option"));
$(".user-list-container").prepend($(".user-list-option.clearfix"));
$("#new_list_button_option").insertAfter(".user-search-option");
$("#new_list_button_option").prepend($("#table_count"));

table.on('click', 'td', function () {
    var cell = table.cell(this).index();
    if (cell.column < 7) {
        location.href = $(this).parent().data('url');
    }
});

