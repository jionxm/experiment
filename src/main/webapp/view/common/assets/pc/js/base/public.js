
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