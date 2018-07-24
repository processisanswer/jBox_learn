
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>prompt方法</title>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>

    <link rel="stylesheet" href="static/jquery-jbox/2.3/Skins/ShareGreen/jbox.css">
    <script>
        $(document).ready(function () {

            $("#customBtn").click(function () {
                var submit=function (v,h,f) {
                    if(v==true){
                        jBox.tip(v,'info');
                        //jBox.tip('嗯','info');
                    }else{
                        jBox.tip(v,'info');
                        //jBox.tip('好呀','info');
                    }
                    return true;
                };
                //自定义按钮
                $.jBox.confirm('天使，可以去吃个饭吗?','表白提示',submit,{buttons:{'嗯':true,'好呀':false}})

            });

            $("#saveBtn").click(function () {
                var submit=function (v,h,f) {
                    if(v==1){
                        jBox.tip('已经执行保存操作','info');
                    }else if(v==0){
                        jBox.tip('已取消保存','info');
                    }
                    return true;//关闭
                };
                //是否保存
                jBox.confirm('确定保存?','保存提示',submit,{
                    buttons:{
                        '确定':1,'取消':0
                    },
                    closed:function () {
                        //jBox.tip('窗口关闭','info');
                        //alert('窗口关闭');
                    }
                });

            });

        });
        function showPrompt() {
            $.jBox.prompt('Hello jBox','提示','success',{
                closed:function () {
                    alert('你关闭了提示');
                }
            });
        }
        function showAlert() {
            jBox.alert('Hello,Spicoming','Alert');
        }
        function showInfo(){
            jBox.info('Hello,Zhuzi','Info');
        }
        function showSuccess() {
            jBox.success('Hello，success','Success');
        }
        function showError(){
            jBox.error('Hello,error','Error');
        }
        function showConfirm() {
            var submit=function(v,h,f){
                if(v=='ok'){
                    jBox.tip(v,'info');
                }else if(v=='cancel'){
                    jBox.tip(v,'info');
                }
                return true;//close
            };
            jBox.confirm('确定吗?','提示',submit);
        }

    </script>

</head>
<body>
<input type="button" id="showPrompt" value="提示输入框" onclick="showPrompt()">
<input type="button" id="" value="alert" onclick="showAlert()"><br>
<input type="button" id="" value="info" onclick="showInfo()"><br>
<input type="button" id="" value="success" onclick="showSuccess()"><br>
<input type="button" id="" value="error" onclick="showError()"><br>
<input type="button" id="" value="confirm" onclick="showConfirm()"><br>
<input type="button" id="" value="warning" onclick="showWarning()"><br>

<button type="button" id="customBtn">自定义按钮</button><br>
<button type="button" id="saveBtn">自定义场景</button><br>

</body>
</html>
