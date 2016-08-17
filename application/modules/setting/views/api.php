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
                                <li class="active"><a href="#tab_1" data-toggle="tab">黄金价格查询接口</a></li>
                                <li><a href="#tab_2" data-toggle="tab">Tab 2</a></li>
                                <li><a href="#tab_3" data-toggle="tab">Tab 3</a></li>

                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab_1">
                                    <div class="col-sm-12 do-result">
                                    </div>
                                    <div class="row">
                                    <div class="col-sm-7">
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
                                                    <th>上海黄金交易所价格查询接口</th><td>http://apis.baidu.com/netpopo/gold/shgold</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>上海期货交易所价格查询接口</th><td>http://apis.baidu.com/netpopo/gold/shfutures</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>香港金银业贸易场价格查询接口</th><td>http://apis.baidu.com/netpopo/gold/hkgold</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>银行账户黄金价格查询接口</th><td>http://apis.baidu.com/netpopo/gold/bank</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>伦敦金、银价格查询接口</th><td>http://apis.baidu.com/netpopo/gold/london</td>
                                                </tr>
                                                <tr class="fetch_apiurl">
                                                    <th>货币贵金属价格查询接口</th><td>http://apis.baidu.com/netpopo/gold/currency</td>
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
    //CURL示例
    curl  --get --include  'http://apis.baidu.com/netpopo/gold/shgold'  -H 'apikey:您自己的apikey'


    //PHP示例
    &lt;?php
        $ch = curl_init();
        $url = 'http://apis.baidu.com/netpopo/gold/shgold';
        $header = array(
            'apikey: 您自己的apikey',
        );
        // 添加apikey到header
        curl_setopt($ch, CURLOPT_HTTPHEADER  , $header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // 执行HTTP请求
        curl_setopt($ch , CURLOPT_URL , $url);
        $res = curl_exec($ch);

        var_dump(json_decode($res));
    ?&gt;
</pre>
                                    </div>
                                        <div class="col-sm-5">
                                        <b>JSON返回示例 </b>
<pre>{
&nbsp;&nbsp;&nbsp;&nbsp;"status": "0",
&nbsp;&nbsp;&nbsp;&nbsp;"msg": "ok",
&nbsp;&nbsp;&nbsp;&nbsp;"result": [
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"type": "Au(T+D)",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"typename": "黄金延期",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"price": "238.05",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"openingprice": "241.00",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"maxprice": "241.50",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"minprice": "237.50",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"changepercent": "-0.90%",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"lastclosingprice": "240.22",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"tradeamount": "45998.0000",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"updatetime": "2015-10-26 15:29:13"
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;},
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"type": "Au99.99",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"typename": "沪金99",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"price": "238.30",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"openingprice": "241.48",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"maxprice": "241.48",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"minprice": "238.00",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"changepercent": "-0.91%",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"lastclosingprice": "240.49",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"tradeamount": "25400.9800",
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"updatetime": "2015-10-26 15:29:15"
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp;&nbsp;&nbsp;]
}</pre>
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

温馨提示：数据的有效性为一个小时。即数据更新时间的一小时之内有效。</pre>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_2">
                                    The European languages are members of the same family. Their separate existence is a myth.
                                    For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
                                    in their grammar, their pronunciation and their most common words. Everyone realizes why a
                                    new common language would be desirable: one could refuse to pay expensive translators. To
                                    achieve this, it would be necessary to have uniform grammar, pronunciation and more common
                                    words. If several languages coalesce, the grammar of the resulting language is more simple
                                    and regular than that of the individual languages.
                                </div>
                                <!-- /.tab-pane -->
                                <div class="tab-pane" id="tab_3">
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