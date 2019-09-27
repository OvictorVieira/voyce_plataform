$(function () {

    let buttonAction = $("#button-action");

    buttonAction.on('click', function () {
        buttonAction.attr("disabled", true);
        $('#form-action').submit();
    });
});