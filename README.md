# jBox_learn
创建窗口、提示、通知的jQuery插件，强大、灵活
1  $.jBox(content,options);
- content　(string,json)
  　　　└ 可以是string或json。当是string时，
         需要加上前缀标识（html:、id:、get:、post:、iframe:），
         如果没有加标识，系统会自动加上html:，具体请看应用例子。
         当是json时，表示一个或多个状态，
         每个状态的默认值为 $.jBox.stateDefaults。
  - options　[可选] (json)
  　　　└ 其它参数选项，默认值为 $.jBox.defaults。
2  $.jBox.open(content,title,width,height,options);
        参数说明：
        - content　(string,json)
        　　　└ 可以是string或json。当是string时，需要加上前缀标识（html:、id:、get:、post:、iframe:），如果没有加标识，系统会自动加上html:，具体请看应用例子。当是json时，表示一个或多个状态，每个状态的默认值为 $.jBox.stateDefaults。
        - title　[可选] (string)
        　　　└ 窗口标题，值为null时为不显示标题，默认值为 $.jBox.defaults.title。
        - width　[可选] (string,number)
        　　　└ 窗口宽度，值为'auto'或具体像素值（例如350），默认值为 $.jBox.defaults.width。
        - height　[可选] (string,number)
        　　　└ 窗口高度，值为'auto'或具体像素值（例如100），默认值为 $.jBox.defaults.height。
        - options　[可选] (json)
        　　　└ 其它参数选项，默认值为 $.jBox.defaults。
        备注：$.jBox.open() 只是 $.jBox() 的一个扩展，方便 title、width、height 参数的传递
3  $.jBox.prompt(content,title,icon,options);
        参数说明：
        - content(string)
            只能是string，不支持前缀标识，默认值为''.
        - title[可选](string)
            窗口标题，值为null时为不显示标题，默认值为$.jBox.defaults.title.
        - icon[可选](string)
            内容图标，值为'none'时为不显示图标，可选值为'none','info','question',
            'success','warning','error',默认值为'none'.
        - options[可选](json)
            其他参数选项，默认值为$.jBox.defaults.
        扩展方法
        $.jBox.alert(content,title,options);
        $.jBox.info(content,title,options);
        $.jBox.success(content,title,options);
        $.jBox.error(content,title,options);
        $.jBox.confirm(content,title,submit,options);
        $.jBox.warning(content,title,submit,options);
        扩展方法中默认按钮的文字设置在$.jBox.languageDefaults
4  $.jBox.tip(conten,icon,options);
        - content　(string)
        　　　└ 只能是string，不支持前缀标识，默认值为''。
        - icon　[可选] (string)
        　　　└ 内容图标，可选值有'info'、'success'、'warning'、'error'、'loading'，
                默认值为'info'，当为'loading'时，timeout值会被设置为0，表示不会自动关闭。
        - options　[可选] (json)
        　　　└ 其它参数选项，默认值为 $.jBox.tipDefaults。
        备注：如果想手动关闭tip，请调用　$.jBox.closeTip()　方法。
5  $.jBox.message(content,title,timeout,options)
    参数说明
    - content　(string)
    　　　└ 只能是string，不支持前缀标识，默认值为''。
    - title　[可选] (string)
    　　　└ 窗口标题，值为null时为不显示标题，默认值为 $.jBox.messagerDefaults.title。
    - timeout　[可选] (number)
    　　　└ 显示多少毫秒后自动关闭，如果为0则不自动关闭，默认值为 $.jBox.messagerDefaults.timeout。
    - options　[可选] (json)
    　　　└ 其它参数选项，默认值为 $.jBox.messagerDefaults。

    备注：如果想手动关闭messager，请调用　$.jBox.closeMessager()　方法。

6  jBox其他成员
    全局设置：
    $.jBox.defaults
    $.jBox.stateDefaults
    $.jBox.tipDefaults
    $.jBox.messagerDefaults
    $.jBox.languageDefaults
    其它函数：
    - $.jBox.setDefaults(configs);
    　　　└ 设置全局设置，请参考 demo.js 里的使用。
    - $.jBox.getBox();
    　　　└ 获取最前面打开的窗口jQuery对象。
    - $.jBox.getIframe(jBoxId);
    　　　└ 获取最前面打开的或指定ID的窗口里的 iframe jQuery对象。(方便与iframe的交互)
    - $.jBox.getContent();
    　　　└ 获取最前面打开的窗口的内容html。
    - $.jBox.setContent(content);
    　　　└ 设置最前面打开的窗口的内容html。
    - $.jBox.getState(stateNmae);
    　　　└ 获取最前面打开的窗口可见状态内容。（content为多状态下）
    - $.jBox.getStateName();
    　　　└ 获取最前面打开的窗口可见状态的名称。（content为多状态下）
    - $.jBox.goToState(stateName, stateContent);
    　　　└ 显示最前面打开的窗口的指定状态，并可设置状态内容。（content为多状态下）
    - $.jBox.nextState(stateContent);
    　　　└ 显示最前面打开的窗口的下一个状态，并可设置状态内容。（content为多状态下）
    - $.jBox.prevState(stateContent);
    　　　└ 显示最前面打开的窗口的上一个状态，并可设置状态内容。（content为多状态下）
    - $.jBox.close(token);
    　　　└ 关闭最前面打开的窗口，token可以是指定jBox的ID或布尔值，如果是true显示关闭所有已打开的窗口。
    - $.jBox.closeTip();
    　　　└ 关闭提示（由 $.jBox.tip() 打开的）。
    - $.jBox.closeMessager();
    　　　└ 关闭提示（由 $.jBox.messager() 打开的）。
