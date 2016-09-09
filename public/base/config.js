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
        , "sparkline"         : "sparkline/jquery.sparkline.min"
        , "slimscroll"      : "slimScroll/jquery.slimscroll.min"
        , "fastclick"       : "fastclick/fastclick"
        , "iCheck"          : "iCheck/icheck.min"
        , "datepicker"      : "datepicker/bootstrap-datepicker"
        , "ueditor"         : "ueditor/ueditor.all.min"
        , "datatables"      : "datatables/jquery.dataTables.min"
        , "datatables.bs"   : "datatables/dataTables.bootstrap.min"
        , "jquerytreetable" : "treetable/jquery.treetable"
        , "jstree"          : "vakata-jstree/dist/jstree.min"
        , "layer"           : "layer/layer"
    }
});
function getImgURL(fileName){
    var url = '';
    var ext = fileName.substring(fileName.lastIndexOf(".")+1);
    if(ext == 'jpg' || ext == 'jpeg' || ext == 'gif' ||ext =='png'){
        url = fileName;
    }else{
        url = HTTP_SERVER+"public/images/icons/"+ext+".png";
    }
    return url;
}
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

function calculate_total(weight,profit)
{
    return math_mul(weight,profit);
}