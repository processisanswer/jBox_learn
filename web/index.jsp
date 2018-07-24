<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jBox</title>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/jquery.jBox-2.3.min.js"></script>
    <script type="text/javascript" src="static/jquery-jbox/2.3/i18n/jquery.jBox-zh-CN.min.js"></script>
    <link rel="stylesheet" href="static/jquery-jbox/2.3/Skins2/Purple/jbox.css">

    <script>

        $(document).ready(function () {
            $("#showMultiWindow").click(function () {
                alert(11);
                showMultiWindow();
            });
        });
        function showMsg() {

            var info = 'jQuery jBox<br /><br />版本：v2.0<br />日期：' + new Date().toLocaleDateString() + '<br />';
            info += '官网：<a target="_blank" href="http://kudystudio.com/jbox">http://kudystudio.com/jbox</a>';
            $.jBox.info(info);
        }
        // 显示id为id-html的div内部html，同时设置了bottomText
        function showHideMsg() {
            jBox("id:hideMsg", {bottomText: '6不6?'});
        }
        // ajax get 页面ajax.html的内容并显示，例如要提交id=1，则地址应该为 ajax.html?id=1，post:前缀的使用与get:的一样
        function showAjax() {
            jBox("get:ajax.html");
        }

        function showIframe() {
            $.jBox("iframe:https://www.baidu.com", {
                title: "百度一下",
                width: 600,
                height: 400,
                button: {'关闭': true}
            });
        };
        function showMultiWindow() {
            //连续多个窗口
            var content = {
                state1: {
                    content: '状态1',
                    buttons: {'下一步': 1, '取消': 0},
                    buttonsFocus: 0,
                    submit: function (v, h, f) {
                        if (v == 0) {
                            return true;//close the window

                        } else {
                            //$.jBox.nextSate();
                            $.jBox.goToState('state2');
                        }
                        return false;
                    }
                },
                state2: {
                    content: '状态2，请关闭窗口',
                    buttons: {'上一步': 1, '取消':0},
                    buttonsFocus: 0,
                    submit: function (v, h, f) {
                        if (v == 0) {
                            return true;
                        } else {
                            //$.jBox.prevState();//go back
                            $.jBox.goToState('state1');

                        }
                        return false;
                    }
                }
            };
            $.jBox(content);
        }
        function showInputValue() {
            var html="<div style='padding:10px;'>输入姓名：<input type='text' id='yourname' name='yourname'/></div>";
            var submit=function(v,h,f){
                if(f.yourname==null || f.yourname==''){
                    $.jBox.tip("请输入您的姓名。",'error',{focusId:'yourname'});//关闭设置 yourname为焦点
                    return false;
                }
                $.jBox.tip("你叫:"+f.yourname);
                return true;
            };
            jBox(html,{title:'你叫什么名字？',submit:submit})
        }

    </script>
</head>
<body>
<input type="button" value="點我試試" onclick="showMsg();"><br>
<input type="button" value="點我顯示隱藏信息" onclick="showHideMsg();"><br>
<input type="button" value="點我AJAX" onclick="showAjax();"><br>
<input type="button" value="點我iframe" onclick="showIframe();"><br>
<input type="button" value="點我多个连续窗口" id="showMultiWindow"><br>
<input type="button" value="點我输入值" onclick="showInputValue();"><br>
good！
<div id="hideMsg" hidden>hello world！</div>
</body>
</html>
