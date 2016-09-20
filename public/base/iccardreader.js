/**
 * Created by Administrator on 2016/3/17.
 */

var ICCardReader = {};
ICCardReader._init = function()
{
    try
    {
        var obj = new ActiveXObject("YW60X.yw60xCtrl.1");
        document.write('<object id="ICReader"	classid="clsid:167E1838-7388-4A24-86DE-985B91F0FFBF"></object>');
    }
    catch(e)
    {
        //alert("请确认当前浏览器为IE8+系列，并且安装了YW60x读写器控件。若未安装，请点击确定下载");
        //window.navigate("http://www.youwokeji.com.cn/yw60xocxSetup.exe");
    }
}

ICCardReader.Open = function()
{

    return document.ICReader && document.ICReader.YW_USBHIDInitial() > 0;//true//
}

ICCardReader.Close = function()
{
    return document.ICReader.YW_USBHIDFree();
}

ICCardReader.Beep = function(){

    document.ICReader.YW_Buzzer(1,5,5,1);
}


ICCardReader.Request = function()
{
    var i;
    var CardType;
    var vCardNo;
    var LenCardNo;

    if(this.Open()==false)return;

    i = document.ICReader.YW_RequestCard(1,82);
    if(i<0)
    {
        //document.getElementById("CardIDShower").value = document.getElementById("CardIDShower").value + timeStr + "寻卡失败";
        return -1;
    }
    i = document.ICReader.YW_AntiCollide(1);
    if(i<0)
    {
        //document.getElementById("CardIDShower").value = document.getElementById("CardIDShower").value + timeStr + "寻卡失败";
        return -1;
    }

    LenCardNo = document.ICReader.OutData1Size;
    vCardNo   = document.ICReader.OutData1;

    var vCardSerial = document.ICReader.ConvertCardNo(vCardNo, 0);
    i = document.ICReader.YW_CardSelect(1,LenCardNo,vCardNo);
    return vCardSerial;
}


ICCardReader.Read = function()
{
    var BlockID;
    var Key;
    this.Request();
    BlockID = 4;//document.getElementById("BlockIDRead").value;

    var keyRead = 'FFFFFFFFFFFF';//document.getElementById("KeyRead").value

    Key =document.ICReader.GetVariantFromHexStr(keyRead);
    i = document.ICReader.YW_KeyAuthorization(1,96,BlockID,Key);
    if(i<0)
    {
        //document.getElementById("CardIDShower").value = document.getElementById("CardIDShower").value + timeStr + "密钥认证错误";
        Beep();
        return -1;
    }

    i = document.ICReader.YW_ReadaBlock(1,BlockID,16);
    if(i<0)
    {
        //document.getElementById("CardIDShower").value = document.getElementById("CardIDShower").value + timeStr + "读块错误";
        Beep();
        return -2;
    }
    var vCardContent = document.ICReader.GetHexStr(document.ICReader.OutData1);

    this.Close();

    return vCardContent;
}

ICCardReader.Write = function()
{
    var BlockID;
    var Key;
    var Data;
    this.Request();
    BlockID = 4;//document.getElementById("BlockIDWrite").value;
    var keyWrite = 'FFFFFFFFFFFF';//document.getElementById("KeyWrite").value
    Key =document.ICReader.GetVariantFromHexStr(keyWrite);


    i = document.ICReader.YW_KeyAuthorization(1,96,BlockID,Key);
    if(i<0)
    {
        //document.getElementById("CardIDShower").value = document.getElementById("CardIDShower").value + timeStr + "密钥认证错误";
        Beep();
        return -1;
    }

    Data =document.ICReader.GetVariantFromHexStr('188509117660');
    i = document.ICReader.YW_WriteaBlock(1,BlockID,16,Data);
    if(i<0)
    {
        //document.getElementById("CardIDShower").value = document.getElementById("CardIDShower").value + timeStr + "写块错误";
        Beep();
        return -2;
    }

    this.Close();
    return true;
}


ICCardReader._init();