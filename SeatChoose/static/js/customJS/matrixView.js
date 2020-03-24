
$(document).ready(function () {



    var btndata = {
        curId:null,
        curType:0,
        preId:null,
        preType:0,
    };

    //为了把那些类名简化
    var btnes = {
        'info': ' btn-info btn-sm ',
        'primary': ' btn-primary btn-sm ',
        'danger': ' btn-danger btn-sm ',
        'default': ' btn-default btn-sm ',
        'size': ' btn-mysize-'
    }
    $('.btn').click(function () {
        //获取按钮的class内容
        var btna = $(this).attr('class').toString()
        //三次循环，对应三种不同尺寸的按钮
        for(var i=1;i<4;i++){
            //如果按钮是三种类型中的前一种—————与其他！非座位按钮！区别开来
            if(btna.search(btnes['size']+i)>0  ) {
                //如果找到了未被使用的座位对应的按钮
                if (btna.search('info') > 0 || btna.search('danger') > 0 || btna.search('warning') > 0 || btna.search('muted') > 0) {
                    //记录 当前按钮的id,以及 三种按钮类型对于的i值，（1，2，3, 4）三种类型
                    btndata['curId'] = $(this).attr('id').toString()
                    btndata['curType'] = $(this).attr('class')[24]
                    //在控制台输出储存的btndata数据
                    // log(btndata)
                    //在视图页面实现出所选位置的号码（ID）
                    $('.seat-info').text(btndata['curId'])

                    var prebtn = $('#'+btndata['preId']).attr('class')
                    if(prebtn){prebtn = prebtn.toString()}else{prebtn=' '}
                    //如果点击选了第二个未被使用的座位的按钮，就把之前选的座位的按钮的样式变成未使用的样式（temp）
                    if(prebtn.search('primary')!=-1){
                        $('#'+btndata['preId']).attr('class', 'btn btn-seat'+btnes['size']+btndata['preType']+btnes['info'])
                        // log('之前的按钮如果是被选的,那么把他变成未选')
                    }
                    //把未使用的座位对应的按钮样式从info变为primary
                    if(btna.search('info') != -1){
                        $(this).attr('class', 'btn btn-seat'+btnes['size']+ btndata['curType']+btnes['primary'] )
                    }

                    //设置hidden表单的内容为当前选择位置对应的id值
                    $('.opt_seatID').attr('value', btndata['curId'])

                    //在if语句结束时记录之前按钮信息
                    btndata['preId'] = btndata['curId']
                    btndata['preType'] = btndata['curType']
                }else if (btna.search('primary') > 0) {
                    //把已经选择的座位对应的按钮样式从primary变为info
                    $(this).attr('class', 'btn btn-seat'+btnes['size']+i+btnes['info'])
                    //在视图页面实现出所选位置的号码（ID），显示为空
                    $('.seat-info').text('00')
                    //设置hidden表单的内容为当前选择位置对应的id值  设置为空
                    $('.opt_seatID').attr('value','0')
                }
            }
        }

    })




})

