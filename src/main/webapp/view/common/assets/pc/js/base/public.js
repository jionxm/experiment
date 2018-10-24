
const Exp = {};

/* 提示弹窗 */
Exp.showToast = function(c){
    const f = document.createElement("div");
    f.id = "toast";
    f.style.cssText = "position:fixed;top:0;left:0;width:100%;height:100%;z-index:1000001;background:rgba(0,0,0,0)";

    const s = document.createElement("div");
    const t = document.createTextNode(c);
    s.style.cssText = 'position:fixed;left:50%;top:50%;-webkit-transform:translate(-50%,-50%);max-width:300px;padding:10px 20px;line-height:1.5;color:#333;background:#fff;border-radius:10px;text-align:center;box-shadow:0 0 10px #bdcddc;';

    s.appendChild(t);
    f.appendChild(s);
    document.body.appendChild(f);
    setTimeout(() => {
        document.body.removeChild(f);
    }, 3000);
}

/*不自动消失的对话窗*/
Exp.showToastAll = function(c){
    const f = document.createElement("div");
    f.id = "toast";
    f.style.cssText = "position:fixed;top:0;left:0;width:100%;height:100%;z-index:1000001;background:rgba(0,0,0,0)";

    const s = document.createElement("div");
    const t = document.createTextNode(c);
    s.style.cssText = 'position:absolute;left:50%;top:50%;-webkit-transform:translate(-50%,-50%);width:400px;height:200px;line-height:200px;color:#333;background:#fff;border-radius:10px;text-align:center;';

    const bg = document.createElement("div");
    bg.style.cssText = 'width:380px;height:10px;background:#bfbfbf;position:absolute;bottom:-10px;left:10px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;';

    s.appendChild(t);//插入文字内容
    s.appendChild(bg);//插入背景
    f.appendChild(s);//插入文字内容
    document.body.appendChild(f);
}
/*对话窗消失*/
Exp.removeToast = function(){
    var toast = document.getElementById("toast");
    document.body.removeChild(toast);
}