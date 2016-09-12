/**
 * Created by PhpStorm.
 * Author: zhujingxiu
 * DateTime: 2016/9/2 0002 11:47
 *
 */
/**
 * Created by Administrator on 2016/8/8 0008.
 */
window.UEDITOR_HOME_URL = "/public/lib/ueditor/";
define(function(require,exports,modules){
    require('datatables')
    require('datatables.bs');
    exports.render_list = function() {

        $(function () {
            $('#list').DataTable({
                "language": {
                    "url": "/public/lib/datatables/Chinese.json"
                },
                "processing": true,
                "serverSide": true,
                "ajax": {
                    url: '/project/stock/index',
                    data: {list: 1},
                    dataSrc: function (json) {
                        return json.data
                    },
                    type: 'get'
                },
                "columns": [
                    {"data": "status", "name": "p.status"},
                    {"data": "sn", "name": "p.project_sn"},
                    {"data": "customer", "name": "c.realname"},
                    {"data": "weight", "name": "p.weight"},
                    {"data": "period", "name": "p.start"},
                    {"data": "profit", "name": "profit"},
                    {"data": "referrer", "name": "referrer"},
                    {"data": "operator", "name": "operator"},
                    {"data": "addtime", "name": "p.addtime"},
                    {"data": "operation"}
                ],
            })
        });
    }
    exports.render_detail = function (){
        $('#list').delegate('.btn-detail','click', function () {
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/stock/detail', {project:sn}, function(json){
                if(json.code==1){
                    var options = {
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        content: json.msg ,
                    }
                    if(json.terminable){
                        options.btn = ['终止项目', '取消'];
                        options.yes = function (index, layero) {
                            layer.prompt({
                                formType: 2,
                                title: '填写终止原因'
                            }, function(value, index, elem){
                                if(value.length >= 10) {
                                    $.ajax({
                                        type: 'post',
                                        url: '/project/stock/terminated',
                                        data: {project_sn: sn, value: value,mode:json.mode},
                                        dataType: 'json',
                                        beforeSubmit: function () {
                                            layer.load();
                                        },
                                        success: function (json) {
                                            if (json.code == 1) {
                                                location.reload();
                                            } else {
                                                var l = require('layout');
                                                l.render_message(json.msg, json.title);
                                            }
                                        }
                                    })
                                }else{
                                    layer.tips('内容长度不小于10个字符', elem,{tips: 1});
                                }
                            });
                        };
                    }else{
                        options.btn = [ '关闭'];
                    }
                    layer.open(options);
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    };

    exports.render_storage = function(){
        $('#btn-new').bind('click',function(){
            require('layer');
            require('ajaxSubmit');
            //require('ueditor/ueditor.config');
            //require('ueditor');
            require('jqueryvalidate');
            require('customValidate');
            require('slimscroll');
            var sn = $(this).parent().parent().attr('id');
            $.get('/project/stock/storage', {n:Math.random()}, function(json){
                if(json.code==1){
                    layer.open({
                        type: 1,
                        title:json.title,
                        area:'880px',
                        offset: '100px',
                        zIndex:99,
                        btn: ['补仓', '取消'],
                        content: json.msg ,
                        yes: function(index, layero){
                            $('#form-storage').submit();
                        }
                    });
                }else{
                    var l = require('layout');
                    l.render_message(json.msg,json.title);
                }
            },'json');
        });
    };
    exports.render_hidden = function(){
        $('#project-list').delegate('.btn-trashed','click',function(){
            var sn = $(this).parent().parent().attr('id')
            require('layer');
            layer.confirm('确定删除项目'+sn, {icon: 3, title:'删除'}, function(index){
                $.ajax({
                    type:'post',
                    url:'/project/recycling/trashed',
                    data:{project_sn:sn},
                    dataType:'json',
                    success:function(json){
                        if(json.code==1){
                            location.reload();
                        }else{
                            var l = require('layout');
                            l.render_message(json.msg,json.title);
                        }
                    }
                })
            });
        });
    }

    exports.render_stocks = function () {
        $.ajax({
            url:'/project/stock/latest',
            type:'get',
            data:{r:Math.random()},
            dataType:'json',
            success: function (json) {

            }
        })
        require('echarts');
        var myChart = echarts.init(document.getElementById('stock-charts')),
            //app.title = '堆叠柱状图';

        option = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                data:['总克重','金生金','钱生金','服务客户']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    data : ['周一','周二','周三','周四','周五','周六','周日']
                }
            ],
            yAxis : [
                {
                    type : 'value'
                }
            ],
            series : [
                {
                    name:'总克重',
                    type:'bar',
                    data:[320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name:'金生金',
                    type:'bar',
                    data:[120, 132, 101, 134, 90, 230, 210]
                },

                {
                    name:'钱生金',
                    type:'bar',
                    data:[862, 1018, 964, 1026, 1679, 1600, 1570],

                },
                {
                    name:'服务客户',
                    type:'bar',
                    data:[620, 732, 701, 734, 1090, 1130, 1120]
                },
            ]
        };

        myChart.setOption(option);
    }
})
