$(function () {

    let buttonAction = $("#button-action");
    let buttonImageUpload = $("#image_cover");
    let anchorUpload = $("#anchor_upload");

    buttonAction.on('click', function () {
        buttonAction.attr("disabled", true);
        showMaskLoader();
        $('#form-action').submit();
    });

    anchorUpload.on('click', function() {
        buttonImageUpload.click();
    });

    function showMaskLoader() {
        $('#loader').removeClass('d-none');
        $('#bg-mask-loader').removeClass('d-none');
    }
});