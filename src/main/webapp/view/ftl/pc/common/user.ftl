<#assign ctx = request.contextPath />
<div class="user-box">
                <div class="user-info clearfix">
                    <img class="user-head src-head" src="${ctx}/view/common/assets/pc/image/icon_user_head.jpg">
                    <span class="user-nick">${loginName}</span>
                </div>
                <ul class="nav-user clearfix">
                    <li>
                        <a href="${ctx}/logOut">安全退出</a>
                    </li>
                </ul>
</div>