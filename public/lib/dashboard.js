define(function(require, exports, module) {
    //require('moment');
    require('jqueryui');

    //require('daterangepicker
    //require('datepicker');
    require('slimscroll');
    $.widget.bridge('uibutton', $.ui.button);

    $(document).ready(function () {
        'use strict';
        //Make the dashboard widgets sortable Using jquery UI
        $(".connectedSortable").sortable({
            placeholder: "sort-highlight",
            connectWith: ".connectedSortable",
            handle: ".box-header, .nav-tabs",
            forcePlaceholderSize: true,
            zIndex: 999999
        });
        $(".connectedSortable .box-header, .connectedSortable .nav-tabs-custom").css("cursor", "move");

        //jQuery UI sortable for the todo list
        $(".todo-list").sortable({
            placeholder: "sort-highlight",
            handle: ".handle",
            forcePlaceholderSize: true,
            zIndex: 999999
        });
////SLIMSCROLL FOR CHAT WIDGET
        $('#chat-box').slimScroll({
            height: '350px'
        });

    });

    $('#toggle-charts input[name="price_charts"]').bind('change', function () {
        exports.priceGoldView($(this).val());
    })

    exports.render_overview = function () {
        require('echarts');
        var myChart = echarts.init(document.getElementById('overview-charts')),
        option = {
            title: {
                text: '黄金业务概览'
            },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['存金克重','金生金','钱生金','增值克重','服务客户']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
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
                    boundaryGap : false,
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
                    name:'存金克重',
                    type:'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data:[120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name:'金生金',
                    type:'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data:[220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name:'钱生金',
                    type:'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data:[150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name:'增值克重',
                    type:'line',
                    stack: '总量',
                    areaStyle: {normal: {}},
                    data:[320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name:'服务客户',
                    type:'line',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    areaStyle: {normal: {}},
                    data:[820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };
        myChart.setOption(option);
    }
    exports.priceGoldView = function (mode){
        require('echarts');
        $.ajax({
            url : "/tool/api/price",
            data:{mode:mode},
            dataType : 'json',
            success : function(json) {
                exports.renderEchart('gold-price-charts','黄金价格走势图',json.time,json.price);
            }
        });
    }

    exports.renderEchart = function (el,title,dataType,valType){
        var myChart = echarts.init(document.getElementById(el))
        var option = {
            title : {
                text:title,// '黄金价格走势图',
                textStyle:{
                    fontSize: 20,
                    color: '#79654e'
                }
            },
            grid:{
                x:50,
                y:60,
                x2:30,
                y2:30
            },
            tooltip : {
                trigger: 'axis',
                formatter: "{c} 元/克 <br/>"+"{b}",
                enterable:true,
                borderColor:'FF8800',
                borderWidth:2,
                axisPointer:{
                    type: 'line',
                    lineStyle: {
                        color: '#48b',
                        width: 1,
                        type: 'dashed',
                        shadowBlur:0.1
                    }
                }
            },
            toolbox: {
                show : true
            },

            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : dataType,
//				            timeline:{
//						    	controlPosition:'left',
//						        splitLine:false,
//						        splitArea:true,
//						    },
                    splitLine:false,
                    splitArea:true,
                    axisLabel : {
                        show : true,
                        textStyle : {
                            color : '#28c6de'
                        }
                    },
                    axisLine :{
                        lineStyle:{
                            color: '#FF8800',
                            width: 0,
                            type: 'solid'
                        }
                    }

                }
            ],
            yAxis : [
                {
                    type : 'value',
                    scale: true,
                    name : '金价 (元/克)',
                    precision:2,
                    axisLine:{
                        show:true
                    }
                }
            ],
            lineStyle:{
                shadowBlur:0
            },
            series : [
                {
                    type:'line',
                    symbolSize:0,
                    data:valType,
                    showAllSymbol:false,
                    itemStyle:{
                        normal:{
                            lineStyle:{
                                color:'#FF8800',
                                width:0.5
                            }
                        }
                    },
                },
            ]
        };
        // 为echarts对象加载数据
        myChart.setOption(option);
    }
});
