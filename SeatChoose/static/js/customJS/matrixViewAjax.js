document.write('<script language=javascript src="/js/customJS/base.js"></script>');



//成功时的回调函数
function successCallback1 (response){
    // log(response)
    var curPosCode = response['curPosCode'];
    var pos = response['pos'];
    var status = response['status'];
    var timepoint = response['timepoint'];
    if (timepoint){
        demodate = timepoint.substr(5,2);
        demotime = timepoint.substr(17,5);
    }

    log(status);

    if(status==112){
        Viewflash('选座失败 该位置的预约开始时间为:'+demodate+'号'+demotime+' 请合理安排选座时间')
    }else if(status==113 || status==303 || status==114){
        Viewflash('选座失败 该位置已有人使用')
    }else if(status==501){
        Viewflash('您未选座')
    }else if (status==506){
        Viewflash('抱歉请在限定时间(6:00-22:00)内预定')
    }else{
        var style, preType;

        if (status==301) {
            //退座成功,状态 3->1
            $('#btn-submit-1').val('选座');
            $('#btn-submit-2').val('预定');
            $('.btn-seat').removeAttr('disabled');
            $('#btn-submit-2').removeAttr('disabled');
            Viewflash('退座成功');
            style = 'info';

        }else if(status==101 || status==102){
            //选座成功,状态 1->3
            $('#btn-submit-1').val('退座');
            $('#btn-submit-2').val('取消');
            $('.btn-seat').attr('disabled', 'disabled');
            $('#btn-submit-1').removeAttr('disabled');
            $('#btn-submit-2').attr('disabled', 'disabled');
            Viewflash('选座成功! 具体位置是 '+curPosCode+' 号座位');
            style = 'danger';

        }else if(status==103){
            //选座成功,状态1->3
            $('#btn-submit-1').val('退座');
            $('#btn-submit-2').val('取消');
            $('.btn-seat').attr('disabled', 'disabled');
            $('#btn-submit-1').removeAttr('disabled');
            $('#btn-submit-2').attr('disabled', 'disabled');
            Viewflash('选座成功! 具体位置是 '+curPosCode+' 号座位'+'<br>'+' 您这样的选座方式占用时长少于一个小时，如果想要取消请按退座按钮。');
            style = 'danger';

        }else if(status==302){
            //退座成功,状态3->1
            $('#btn-submit-1').val('选座');
            $('#btn-submit-2').val('预定');
            $('.btn-seat').removeAttr('disabled');
            $('#btn-submit-1').removeAttr('disabled');
            $('#btn-submit-2').removeAttr('disabled');
            Viewflash('退座成功');
            style = 'warning';
        }

        preType = $('#'+curPosCode).attr('class')[24];
        pos = pos+'/';

        if(pos==window.location.pathname.substr(8)){
            $('#'+curPosCode).attr('class', 'btn btn-seat btn-mysize-'+preType+' btn-'+style+' btn-sm');
            $('.opt_seatID').attr('value','0')
        }

    }
};
function successCallback2 (response){
    var curPosCode = response['curPosCode'];
    var pos = response['pos'];
    var status = response['status'];
    var timepoint = response['timepoint'];
    if (timepoint){
        demodate = timepoint.substr(5,2);
        demotime = timepoint.substr(17,5);
    }

    log(status);

    if(status==501){
        Viewflash('您未选择座位')
    }else if(status==502){
        Viewflash('抱歉预定功能需要选定时间哟')
    }else if (status==503){
        Viewflash('抱歉您选择的时间为过去的时间')
    }else if (status==504){
        Viewflash('抱歉您不能选择超过当前时间1天的时间')
    }else if (status==505){
        Viewflash('抱歉请在限定时间(6:00-19:00)内预定')
    }else{
        var style, preType;

        if (status==212) { //在被预约的座位后预约失败
            Viewflash('预约失败,该位置为已被预约的位置,该位置的可预约时间是:'+demodate+'号'+demotime+'起的 0.5 小时内');
            style = 'warning';
        }else if(status==213 || status==214){ //预约失败,状态为已使用
            Viewflash('预约失败,该位置已经有人使用不可预约');
            style = 'danger';
        }else if(status==201||status==202){  //预约成功,状态变为已预约

            $('#btn-submit-2').val('取消');
            $('#btn-submit-1').val('退座');
            $('.btn-seat').attr('disabled', 'disabled');
            $('#btn-submit-1').attr('disabled', 'disabled');
            Viewflash('预约成功 具体位置是 '+curPosCode+' 号座位, 具体开始时间是:'+demodate+'号'+demotime);
            style = 'warning';

        }else if(status==301) {
            // 取消成功,状态2->1
            $('#btn-submit-1').val('选座');
            $('#btn-submit-2').val('预定');
            $('.btn-seat').removeAttr('disabled');
            $('#btn-submit-1').removeAttr('disabled');
            $('#btn-submit-2').removeAttr('disabled');
            Viewflash('取消成功');
            style = 'info';

        }else if(status==302){
            // 取消成功,状态2->2
            $('#btn-submit-1').val('选座');
            $('#btn-submit-2').val('预定');
            $('.btn-seat').removeAttr('disabled');
            $('#btn-submit-1').removeAttr('disabled');
            $('#btn-submit-2').removeAttr('disabled');
            Viewflash('取消成功');
            style = 'warning';

        }else if(status==303){

            $('#btn-submit-1').val('选座');
            $('#btn-submit-2').val('预定');
            $('.btn-seat').removeAttr('disabled');
            $('#btn-submit-1').removeAttr('disabled');
            $('#btn-submit-2').removeAttr('disabled');
            Viewflash('取消成功');
            style = 'danger';

        }

        preType = $('#'+curPosCode).attr('class')[24];
        pos = pos+'/';
        if(pos==window.location.pathname.substr(8)){
            $('#'+curPosCode).attr('class', 'btn btn-seat btn-mysize-'+preType+' btn-'+style+' btn-sm');
            $('.opt_seatID').attr('value','0')
        }

    }
};
function calibration(){
    var datetime = $('#time').val();
    if(datetime){
        var h = parseInt(datetime.substr(11,2));
        if(h>20||h<6){
            Viewflash('请将预定时间控制在6:00-20:00');
            return 0;
        }return 1;
    }else{
        Viewflash('抱歉预定功能需要选定时间哟');
        return 0;
    }

};






//  时间格式设置

Date.prototype.Format = function (fmt) { //author: meizz
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "H+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

$(document).ready(function () {
    var endtime=new Date().Format('yy-MM-dd HH:mm');
    $('#time').val(endtime)

    $('.cali').click(function () {
        var datetime = $('#time').val();
        var temp = datetime.substr(9,2);
        var h = parseInt(temp);
        itsID = $(this).attr('id');
        if(itsID=='plus'){
            if((h>=6&&h<=8)||(h>=10&&h<=18)){
            temp = temp[0]+(parseInt(temp[1])+1);
            }else if(h==9){
                temp = '10';
            }else if(h==19){
                temp = '20'
            }
        }else if(itsID=='minus'){
            if((h>=7&&h<=9)||(h>=11&&h<=19)){
            temp = temp[0]+(parseInt(temp[1])-1);
            }else if(h==10){
                temp = '09';
            }else if(h==20){
                temp = '19'
            }
        }
        newtime = datetime.substr(0,9)+temp+datetime.substr(11)
        $('#time').val(newtime)

    })

});



