define(function(require, exports, module) {
    require('moment');
    
    require('jqueryui');
    require('raphael');

    //require('daterangepicker');
    //require('knob');
    require('sparkline');
    require('datepicker');
    require('slimscroll');
    require('morris');
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

/*
        $('.daterange').daterangepicker({
            ranges: {
                'Today': [moment(), moment()],
                'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                'This Month': [moment().startOf('month'), moment().endOf('month')],
                'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            startDate: moment().subtract(29, 'days'),
            endDate: moment()
        }, function (start, end) {
            window.alert("You chose: " + start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        });
*/
        //$(".knob").knob();
        //
        ////Sparkline charts
        var myvalues = [1000, 1200, 920, 927, 931, 1027, 819, 930, 1021];
        $('#sparkline-1').sparkline(myvalues, {
            type: 'line',
            lineColor: '#92c1dc',
            fillColor: "#ebf4f9",
            height: '50',
            width: '80'
        });
        myvalues = [515, 519, 520, 522, 652, 810, 370, 627, 319, 630, 921];
        $('#sparkline-2').sparkline(myvalues, {
            type: 'line',
            lineColor: '#92c1dc',
            fillColor: "#ebf4f9",
            height: '50',
            width: '80'
        });
        myvalues = [15, 19, 20, 22, 33, 27, 31, 27, 19, 30, 21];
        $('#sparkline-3').sparkline(myvalues, {
            type: 'line',
            lineColor: '#92c1dc',
            fillColor: "#ebf4f9",
            height: '50',
            width: '80'
        });


        //The Calender
        $("#calendar").datepicker();

        ////SLIMSCROLL FOR CHAT WIDGET
        $('#chat-box').slimScroll({
            height: '250px'
        });
        //// Morris.js Charts
        //// Sales chart
        var area = new Morris.Area({
            element: 'revenue-chart',
            resize: true,
            data: [
                {y: '2011 Q1', item1: 2666, item2: 2666},
                {y: '2011 Q2', item1: 2778, item2: 2294},
                {y: '2011 Q3', item1: 4912, item2: 1969},
                {y: '2011 Q4', item1: 3767, item2: 3597},
                {y: '2012 Q1', item1: 6810, item2: 1914},
                {y: '2012 Q2', item1: 5670, item2: 4293},
                {y: '2012 Q3', item1: 4820, item2: 3795},
                {y: '2012 Q4', item1: 15073, item2: 5967},
                {y: '2013 Q1', item1: 10687, item2: 4460},
                {y: '2013 Q2', item1: 8432, item2: 5713}
            ],
            xkey: 'y',
            ykeys: ['item1', 'item2'],
            labels: ['Item 1', 'Item 2'],
            lineColors: ['#a0d0e0', '#3c8dbc'],
            hideHover: 'auto'
        });
        var line = new Morris.Line({
            element: 'line-chart',
            resize: true,
            data: [
                {y: '2011 Q1', item1: 2666},
                {y: '2011 Q2', item1: 2778},
                {y: '2011 Q3', item1: 4912},
                {y: '2011 Q4', item1: 3767},
                {y: '2012 Q1', item1: 6810},
                {y: '2012 Q2', item1: 5670},
                {y: '2012 Q3', item1: 4820},
                {y: '2012 Q4', item1: 15073},
                {y: '2013 Q1', item1: 10687},
                {y: '2013 Q2', item1: 8432}
            ],
            xkey: 'y',
            ykeys: ['item1'],
            labels: ['Item 1'],
            lineColors: ['#efefef'],
            lineWidth: 2,
            hideHover: 'auto',
            gridTextColor: "#fff",
            gridStrokeWidth: 0.4,
            pointSize: 4,
            pointStrokeColors: ["#efefef"],
            gridLineColor: "#efefef",
            gridTextFamily: "Open Sans",
            gridTextSize: 10
        });
        //
        ////Donut Chart
        var donut = new Morris.Donut({
            element: 'sales-chart',
            resize: true,
            colors: ["#3c8dbc", "#f56954", "#00a65a"],
            data: [
                {label: "Download Sales", value: 12},
                {label: "In-Store Sales", value: 30},
                {label: "Mail-Order Sales", value: 20}
            ],
            hideHover: 'auto'
        });

        //Fix for charts under tabs
        $('.box ul.nav a').on('shown.bs.tab', function () {
            area.redraw();
            donut.redraw();
            line.redraw();
        });
    });

    $('#toggle-charts input[name="price_charts"]').bind('change', function () {
        exports.priceGoldView($(this).val());
    })


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
