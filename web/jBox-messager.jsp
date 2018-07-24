<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>messager方法</title>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>

    <link rel="stylesheet" href="static/jquery-jbox/2.3/Skins/ShareGreen/jbox.css">

    <script>
        $(document).ready(function () {

        });
        function showMessager1() {
            $.jBox.messager('Hello jBox', 'jBox');
        }
        function showMessager2() {
            $.jBox.messager('Hello jBox2', 'my title',
                    null, {
                        with: 350,
                        showType: 'fade'
                    });
        }
        function showMessager3() {
            $.jBox.messager(
                    'Hello jBox3', 'my tile', 3000, {
                        with: 350,
                        icon: 'info',
                        showType: 'show',
                        buttons: {'去看看': true},
                        submit: function (v, h, f) {
                            $.jBox.info('看个蛋蛋?');
                            return true;
                        }
                    }
            );
        }
        function showMessager4() {
            var  html="<div style='padding:10px'>输入点什么：<input  type='text' id='some' name='some'/></div>";
            var submit=function (v, h, f) {
                if(f.some==''){
                    //或f.some 或 h.find('#some').val() 等于 top.$("#some").val()
                    top.$.jBox.tip('请输入点什么...','error',{focusId:'some'});//关闭设置some为焦点
                    return false;
                }
                top.$.jBox.info('你输入了：'+f.some);
                return true;
            }
            top.$.jBox(html,{title:'输入',submit:submit});
        }
    </script>
</head>
<body>
<input type="button" value="显示小弹窗1" onclick="showMessager1()">
<input type="button" value="显示小弹窗2" onclick="showMessager2()">
<input type="button" value="显示小弹窗3" onclick="showMessager3()">
<input type="button" value="输入点什么" onclick="showMessager4()">
</body>
</html>
