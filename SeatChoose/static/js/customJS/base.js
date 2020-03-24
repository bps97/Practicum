var log = console.log.bind(console)
function Viewflash(str) {
    $('#flash_msg').html('<big>'+str+'</big>');
    $('#flash_modal').modal('show')
}