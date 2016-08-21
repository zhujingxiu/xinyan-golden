/**
 * Created by Administrator on 2016/8/9 0009.
 */
seajs.config({
    base: "/public/lib",
    alias: {
        "ajaxSubmit"        : "../base/jquery.form"
        , "ajaxUpload"      : "../base/jquery.ajaxupload"
        , "maxlength"       : "../base/jquery.maxlength.min"
        , "bootstrap"       : "bootstrap/js/bootstrap.min"
        , "moment"          : "moment/moment.min"
        , "jqueryui"        : "jquery-ui/jquery-ui.min"
        , "jqueryvalidate"  : "jquery-validation/dist/jquery.validate.min"
        , "echarts"         : "echarts/echarts.common.min"
        , "slimscroll"      : "slimScroll/jquery.slimscroll.min"
        , "fastclick"       : "fastclick/fastclick"
        , "raphael"         : "raphael/raphael"
        , "morris"          : "morris/morris.min"
        , "iCheck"          : "iCheck/iCheck.min"
        , "sparkline"       : "sparkline/jquery.sparkline.min"
        , "knob"            : "knob/jquery.knob"
        , "daterangepicker" : "daterangepicker/daterangepicker"
        , "datepicker"      : "datepicker/bootstrap-datepicker"
        , "ueditor"         : "ueditor/ueditor.all.min"
        , "datatables"      : "datatables/jquery.dataTables.min"
        , "datatables.bs"   : "datatables/dataTables.bootstrap.min"
        , "switch.bs"       : "bootstrap-switch/bootstrap-switch.min"
        , "jquerytreetable" : "treetable/jquery.treetable"
        , "jstree"          : "https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"
        , "layer"           : "layer/layer"
    }
});

function math_add(a, b) {
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return e = Math.pow(10, Math.max(c, d)), (math_mul(a, e) + math_mul(b, e)) / e;
}

function math_sub(a, b) {
    var c, d, e;
    try {
        c = a.toString().split(".")[1].length;
    } catch (f) {
        c = 0;
    }
    try {
        d = b.toString().split(".")[1].length;
    } catch (f) {
        d = 0;
    }
    return e = Math.pow(10, Math.max(c, d)), (math_mul(a, e) - math_mul(b, e)) / e;
}

function math_mul(a, b) {
    var c = 0,
        d = a.toString(),
        e = b.toString();
    try {
        c += d.split(".")[1].length;
    } catch (f) {}
    try {
        c += e.split(".")[1].length;
    } catch (f) {}
    return Number(d.replace(".", "")) * Number(e.replace(".", "")) / Math.pow(10, c);
}

function math_div(a, b) {
    var c, d, e = 0,
        f = 0;
    try {
        e = a.toString().split(".")[1].length;
    } catch (g) {}
    try {
        f = b.toString().split(".")[1].length;
    } catch (g) {}
    return c = Number(a.toString().replace(".", "")), d = Number(b.toString().replace(".", "")), math_mul(c / d, Math.pow(10, f - e));
}