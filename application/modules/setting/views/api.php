<?php defined('BASEPATH') OR exit('No direct script access allowed');?>
<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>
        API参数设置
        <small>advanced tables</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="<?php echo site_url()?>"><i class="fa fa-dashboard"></i> 控制面板</a></li>
        <li class="active">API参数设置</li>
    </ol>
</section>

<!-- Main content -->
<section class="content">
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title">模块API</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#api-gold" data-toggle="tab">黄金价格查询接口</a></li>
                            <li class="disabled"><a href="#api-sms" data-toggle="tab">短信接口</a></li>
                            <li class="hidden"><a href="#tab_3" data-toggle="tab">Tab 3</a></li>

                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="api-gold">
                                <div class="col-sm-12 do-result">
                                </div>
                                <div class="row">
                                    <div class="col-sm-8">
                                        <?php echo form_open('setting/api/save', array('id' =>'api-golden-price','class'=>'form-horizontal' ))?>
                                        <div class="form-group">
                                            <div class="col-sm-12">
                                                <div class="input-group input-group-sm">
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn btn-success">APIKey</button>
                                                    </div>
                                                    <input type="text" name="golden_price[apikey]" class="form-control" value="<?php echo $golden_price['apikey']?>">
                                                    <div class="input-group-btn">
                                                        <button type="button" class="btn btn-success">APIURL</button>
                                                    </div>
                                                    <input type="text" name="golden_price[apiurl]" class="form-control" value="<?php echo $golden_price['apiurl']?>">
                                                    <span class="input-group-btn">
                                                        <button type="button" form="api-golden-price" class="btn btn-primary btn-flat btn-form-save">保存</button>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        </form>
                                        <div class="callout callout-gray">
                                            <h4>接口类型</h4>
                                        </div>
                                        <div class="interface-line clearfix">
                                            <table class="table table-hover">
                                                <tr class="fetch_apiurl">
                                                    <th>上海黄金交易所价格查询接口</th><td>http://api.jisuapi.com/gold/shgold</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>上海期货交易所价格查询接口</th><td>http://api.jisuapi.com/gold/shfutures</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>香港金银业贸易场价格查询接口</th><td>http://api.jisuapi.com/gold/hkgold</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>银行账户黄金价格查询接口</th><td>http://api.jisuapi.com/gold/bank</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>伦敦金、银价格查询接口</th><td>http://api.jisuapi.com/gold/london</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>货币贵金属价格查询接口</th><td>http://api.jisuapi.com/gold/currency</td>
                                                </tr>
                                            </table>
                                            <table class="table table-hover table-bordered">
                                                <thead>
                                                <tr>
                                                    <th >参数名</th>
                                                    <th >类型</th>
                                                    <th >必填</th>
                                                    <th >参数位置</th>
                                                    <th >描述</th>
                                                    <th >默认值</th>
                                                </tr>
                                                </thead>
                                                <tbody >
                                                <tr>
                                                    <td ><div  style="width:145px;" title="apikey">apikey</div></td>
                                                    <td >string</td>
                                                    <td >是</td>
                                                    <td >header</td>
                                                    <td> <div  title="API密钥">API密钥</div> </td>
                                                    <td ><div  >您自己的apikey</div></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <b>请求示例 </b>
<pre>
    //支持格式：JSON,JSONP
    //请求方法：GET
    $appkey = 'your_appkey_here';//你的appkey
    $url = "http://api.jisuapi.com/gold/currency?appkey=$appkey";
    $result = curlOpen($url);

    $jsonarr = json_decode($result, true);
    //exit(var_dump($jsonarr));

    if($jsonarr['status'] != 0)
    {
        echo $jsonarr['msg'];
        exit();
    }

    $result = $jsonarr['result'];
    foreach($result as $val)
    {
        echo    $val['type'].' '.
                $val['price'].' '.
                $val['changequantity'].' '.
                $val['dollarrate'].' '.
                $val['ratechange'].' '.
                $val['updatetime'].'&lt;br&gt;';
    }
</pre>
                                    </div>
                                    <div class="col-sm-4">
                                        <b>JSON返回示例 </b>
<pre>
{
    "status": "0",
    "msg": "ok",
    "result": [
        {
            "type": "Au(T+D)",
            "typename": "黄金延期",
            "price": "238.05",
            "openingprice": "241.00",
            "maxprice": "241.50",
            "minprice": "237.50",
            "changepercent": "-0.90%",
            "lastclosingprice": "240.22",
            "tradeamount": "45998.0000",
            "updatetime": "2015-10-26 15:29:13"
        },
        {
            "type": "Au99.99",
            "typename": "沪金99",
            "price": "238.30",
            "openingprice": "241.48",
            "maxprice": "241.48",
            "minprice": "238.00",
            "changepercent": "-0.91%",
            "lastclosingprice": "240.49",
            "tradeamount": "25400.9800",
            "updatetime": "2015-10-26 15:29:15"
        }
    ]
}
</pre>
<pre>返回参数信息：
type：品种代号
typename：品种名称
price：最新价
openingprice：开盘价
maxprice：最高价
minprice：最低价
changepercent：涨跌幅
lastclosingprice：昨收盘价
tradeamount：总成交量
updatetime：更新时间

status见错误码列表。
</pre>
                                    </div>
                                </div>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane" id="api-sms">
                                <h3>暂未开通......</h3>
                            </div>
                            <!-- /.tab-pane -->
                            <div class="tab-pane hidden" id="tab_3">
                                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                                when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                                It has survived not only five centuries, but also the leap into electronic typesetting,
                                remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                                sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                                like Aldus PageMaker including versions of Lorem Ipsum.
                            </div>
                            <!-- /.tab-pane -->
                        </div>
                        <!-- /.tab-content -->
                    </div>
                </div>
                <!-- /.box-body -->
            </div>

            <!-- /.box -->
        </div>
        <!-- /.col -->
    </div>
    <!-- /.row -->
</section>
<!-- /.content -->

<script type="text/javascript">
    seajs.use('setapi');
</script>