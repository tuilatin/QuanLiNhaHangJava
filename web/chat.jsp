<%@page import="java.util.List"%>
<%@page import="dao.chatDAO"%>
<%@page import="entity.NguoiDung"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    String idNguoiNhan = request.getParameter("nhan");
    NguoiDung account = (NguoiDung) session.getAttribute("acc");
    if (account == null) {
        response.sendRedirect("login");
        return;
    }
    String idND = account.getId() + "";
    String email = account.getEmail();
    
    chatDAO dao =new chatDAO();
    
    List<NguoiDung> listND =dao.getAllNguoiLienLac(account.getId());  
    if(listND != null && !listND.isEmpty()){
        request.setAttribute("listND", listND);
    }
    
    NguoiDung nguoiDung= dao.getNguoiDungById(idNguoiNhan);
    request.setAttribute("nguoiDung", nguoiDung);
    
    String keyword =request.getParameter("keyword");
    List<NguoiDung> list2=dao.searchNguoiDung(keyword);
    if(list2 != null && !list2.isEmpty()){
        request.setAttribute("listND", list2);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Chat WebSocket</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="chat.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: #f0f2f5;
        }
        .main-container {
            display: flex;
            flex-direction: row;
            height: 100vh;
            width: 100vw;
        }
        .sidebar {
            max-width: 280px;
            width: 100%;
            height: 100vh;
            background: #fff;
            border-right: 1px solid #e0e0e0;
            overflow-y: auto;
            box-shadow: 2px 0 8px rgba(0,0,0,0.04);
            display: flex;
            flex-direction: column;
        }
        .chat-area {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: flex-start;
            background: linear-gradient(135deg, #f0f2f5 60%, #e3e9f7 100%);
            height: 100vh;
            overflow: auto;
            position: relative;
        }
        #chatBox {
            border: none;
            height: 450px;
            max-width:  1000px;
            width: 100%;
            overflow-y: auto;
            padding: 24px 18px 14px 18px;
            background-color: #fff;
            display: flex;
            flex-direction: column;
            gap: 14px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
            border-radius:0 0 18px 18px;
            margin-bottom: 18px;
            margin-top: 0;
        }
        .message {
            display: flex;
            align-items: flex-end;
            max-width: 80%;
        }
        .sent {
            align-self: flex-end;
            flex-direction: row-reverse;
        }
        .received {
            align-self: flex-start;
        }
        .bubble {
            padding: 12px 20px;
            border-radius: 20px;
            font-size: 15px;
            line-height: 1.6;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            word-break: break-word;
            margin: 0 8px;
        }
        .sent .bubble {
            background: linear-gradient(135deg, #0084ff 60%, #00c6fb 100%);
            color: #fff;
            border-bottom-right-radius: 6px;
        }
        .received .bubble {
            background: #f1f0f0;
            color: #222;
            border-bottom-left-radius: 6px;
        }
        .avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #8e99f3;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #fff;
            font-size: 17px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .input-area {
            max-width:  890px;
            width: 100%;
            display: flex;
            gap: 10px;
            margin-bottom: 24px;
            border-radius: 0 0 14px 14px;
            
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            margin-top: 0;
        }
        input {
            flex: 1;
            padding: 14px 18px;
            border-radius: 22px;
            border: 1.5px solid #bfc7d1;
            font-size: 15px;
            outline: none;
            background: #f7f7f7;
            transition: border 0.2s;
        }
        input:focus {
            border: 1.5px solid #0084ff;
            background: #fff;
        }
        button {
            border-radius: 22px;
            background: linear-gradient(135deg, #0084ff 60%, #00c6fb 100%);
            color: white;
            border: none;
            cursor: pointer;
            padding: 0 28px;
            font-size: 15px;
            font-weight: bold;
            transition: background 0.2s, box-shadow 0.2s;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        button:hover {
            background: linear-gradient(135deg, #006ddf 60%, #00b5e2 100%);
            box-shadow: 0 4px 16px rgba(0,0,0,0.12);
        }
        .search-bar {
            display: flex;
            align-items: center;
            padding: 0 12px 0 12px;
            border-bottom: none;
            background: none;
            margin-top: 18px;
            margin-bottom: 8px;
            gap: 8px;
        }
        .search-bar input[type="text"] {
            width: 100%;
            padding: 10px 16px;
            border-radius: 20px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
            background: #f7f7f7;
            font-size: 15px;
            outline: none;
        }
        .search-bar input[type="text"]:focus {
            border-color: #0078ff;
            background: #fff;
            box-shadow: 0 0 4px rgba(0, 120, 255, 0.12);
        }
        .search-bar button[type="submit"] {
            background: linear-gradient(135deg, #0084ff 60%, #00c6fb 100%);
            border: none;
            color: #fff;
            border-radius: 50%;
            width: 38px;
            height: 38px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            margin-left: 6px;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
            transition: background 0.2s;
        }
        .search-bar button[type="submit"]:hover {
            background: linear-gradient(135deg, #006ddf 60%, #00b5e2 100%);
        }
        .search-bar button[type="submit"] i {
            pointer-events: none;
        }
        .filter-bar {
            display: flex;
            justify-content: space-around;
            padding: 10px 0;
            font-size: 14px;
            border-bottom: 1px solid #f3f3f3;
            background-color: #f5f5f5;
        }
        .filter-bar span {
            cursor: pointer;
            padding: 6px 14px;
            border-radius: 12px;
            transition: background-color 0.3s, color 0.3s;
        }
        .filter-bar .active {
            background-color: #0078ff;
            color: white;
        }
        .filter-bar span:hover {
            background-color: #0078ff;
            color: white;
        }
        .chat-list {
            padding: 0;
            margin: 0;
        }
        .chat-item {
            display: flex;
            align-items: center;
            padding: 12px 10px;
            cursor: pointer;
            border-bottom: 1px solid #f0f0f0;
            border-radius: 12px;
            margin: 4px 8px;
            transition: background 0.2s, box-shadow 0.2s, transform 0.15s;
        }
        .chat-item:hover {
            background: #eaf3ff;
            box-shadow: 0 2px 8px rgba(0,0,0,0.06);
            transform: scale(1.02);
        }
        .chat-item.selected {
            background-color: #dceeff;
        }
        .avatar-list {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            margin-right: 14px;
            border: 2px solid #e0e0e0;
            transition: border-color 0.3s;
            background: linear-gradient(135deg, #8e99f3 60%, #b6e0fe 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            color: #fff;
            font-size: 18px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        }
        .chat-item:hover .avatar-list {
            border-color: #0078ff;
        }
        .chat-info {
            flex-grow: 1;
        }
        .chat-name {
            font-weight: bold;
            margin-bottom: 3px;
            font-size: 16px;
            color: #222;
            letter-spacing: 0.2px;
            transition: color 0.2s;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
        }
        .chat-item:hover .chat-name {
            color: #0084ff;
            text-shadow: 0 1px 6px #b6e0fe;
        }
        .chat-msg {
            font-size: 13px;
            color: #555;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .chat-time {
            font-size: 12px;
            color: gray;
            text-align: right;
            min-width: 60px;
        }
        .badge {
            background-color: red;
            color: white;
            padding: 2px 6px;
            border-radius: 10px;
            font-size: 11px;
            margin-left: 4px;
            animation: bounce 0.4s ease;
        }
        @keyframes bounce {
            0% { transform: scale(0.8); }
            50% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }
        a, a:visited, a:hover, a:active {
            text-decoration: none !important;
        }
        .menu-btn-float {
            position: absolute;
            top: 18px;
            right: 32px;
            z-index: 10;
            padding: 0 16px;
            height: 38px;
            border: none;
            border-radius: 20px;
            background: linear-gradient(135deg, #0084ff 60%, #00c6fb 100%);
            color: #fff;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            box-shadow: 0 2px 8px rgba(0,0,0,0.10);
            transition: background 0.2s, color 0.2s;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .menu-btn-float:hover {
            background: linear-gradient(135deg, #006ddf 60%, #00b5e2 100%);
            color: #fff;
        }
        .hamburger {
            display: none;
            position: fixed;
            top: 18px;
            left: 18px;
            z-index: 1100;
            width: 38px;
            height: 38px;
            background: #fff;
            border: none;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.10);
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 6px;
            cursor: pointer;
        }
        .hamburger span {
            display: block;
            width: 24px;
            height: 3px;
            background: #0084ff;
            border-radius: 2px;
            transition: all 0.3s;
        }
        .chat-header {
            width: 100%;
            max-width: 890px;
            background: linear-gradient(90deg, #0078ff 80%, #005bb5 100%);
            border-radius: 14px 14px 0 0;
            box-shadow: 0 2px 8px rgba(0,0,0,0.04);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 16px 24px 12px 24px;
            font-size: 18px;
            font-weight: bold;
            color: #fff;
            margin-bottom: 0;
            margin-top: 0;
            letter-spacing: 0.5px;
            gap: 16px;
        }
        .chat-header .menu-btn-float {
            position: static;
            margin: 0;
            height: 34px;
            font-size: 15px;
            padding: 0 16px;
            border-radius: 16px;
            box-shadow: none;
        }
        .chat-header-title {
            color: #fff;
            font-weight: bold;
            font-size: 18px;
            letter-spacing: 0.5px;
            flex: 1;
            text-align: left;
        }
        @media (max-width: 900px) {
            .sidebar {
                position: fixed;
                left: -300px;
                top: 0;
                height: 100vh;
                z-index: 1200;
                background: #fff;
                transition: left 0.3s;
                box-shadow: 2px 0 8px rgba(0,0,0,0.12);
                max-width: 80vw;
                width: 260px;
            }
            .sidebar.active {
                left: 0;
            }
            .main-container {
                flex-direction: column;
            }
            .chat-area {
                width: 100vw;
            }
            .hamburger {
                display: flex;
            }
            body.sidebar-open {
                overflow: hidden;
            }
            .chat-header {
                max-width: 100vw;
                border-radius: 0;
                margin-top: 0;
                padding: 14px 10px 10px 16px;
                font-size: 16px;
                gap: 10px;
            }
            .chat-header-title {
                font-size: 16px;
            }
            .input-area {
                border-radius: 0 0 0 0;
            }
        }
    </style>
</head>
<body>
    <button class="hamburger" onclick="toggleSidebar()">
        <span></span>
        <span></span>
        <span></span>
    </button>
    <div class="main-container">
        <div class="sidebar">
            <form action="chat.jsp" method="post" style="margin:0;">
                <div class="search-bar">
                    <input type="text" name="keyword" placeholder="Tìm kiếm..." />
                    <button type="submit"><i class="fa fa-search"></i></button>
                </div>
            </form>
            <div class="filter-bar">
                <span class="active">Tất cả</span>
                <span>Chưa đọc</span>
                <span>Phân loại</span>
            </div>
            <c:forEach  items="${listND}" var="o">
            <div class="chat-list">
                <a href="chat.jsp?nhan=${o.id}">
                <div class="chat-item">
                    <div class="avatar-list">${o.tenND.substring(0,1).toUpperCase()}</div>
                    <div class="chat-info">
                        <div class="chat-name">${o.tenND}</div>
                        <div class="chat-msg"></div>
                    </div>
                    <div class="chat-time">${o.trangthai}</div>
                </div>
               </a>
            </div>
            </c:forEach>
        </div>
        <div class="chat-area">
            <div class="chat-header">
                <span class="chat-header-title">💬 ${nguoiDung.tenND}</span>
                <button class="menu-btn-float" onclick="window.location.href='home'">← Trang chủ</button>
            </div>
            <div id="chatBox"></div>
            <div class="input-area">
                <input id="msg" placeholder="Nhập tin..." onkeypress="if(event.key==='Enter') send()" />
                <button onclick="send()">Gửi</button>
            </div>
        </div>
    </div>

<script>
    const idNguoiGui = "<%= idND %>";
    const idNguoiNhan = "<%= idNguoiNhan %>";
    const chatBox = document.getElementById("chatBox");

    const socket = new WebSocket("ws://" + location.host + "/web_nhahang/chat/" + idNguoiGui + "/" + idNguoiNhan);

    socket.onmessage = e => {
        const msg = e.data;
        const div = document.createElement("div");
        const bubble = document.createElement("div");
        const avatar = document.createElement("div");

        let sender = "";
        if (msg.startsWith(idNguoiGui + ":")) {
            div.className = "message sent";
            sender = "<%= email %>";
            bubble.textContent = msg.substring((idNguoiGui + ":").length);
        } else {
            div.className = "message received";
            sender = "NV";
            bubble.textContent = msg;
        }
        avatar.className = "avatar";
        avatar.textContent = sender.charAt(0).toUpperCase();

        bubble.className = "bubble";
        div.appendChild(avatar);
        div.appendChild(bubble);

        chatBox.appendChild(div);
        chatBox.scrollTop = chatBox.scrollHeight;
    };

    function send() {
        const input = document.getElementById("msg");
        const msg = input.value.trim();
        if (msg && socket.readyState === WebSocket.OPEN) {
            socket.send(msg);
            input.value = "";
        }
    }

    function toggleSidebar() {
        const sidebar = document.querySelector('.sidebar');
        sidebar.classList.toggle('active');
        document.body.classList.toggle('sidebar-open');
    }

    // Đóng sidebar khi click ra ngoài (mobile)
    document.addEventListener('click', function(e) {
        const sidebar = document.querySelector('.sidebar');
        const hamburger = document.querySelector('.hamburger');
        if (window.innerWidth <= 900 && sidebar.classList.contains('active')) {
            if (!sidebar.contains(e.target) && !hamburger.contains(e.target)) {
                sidebar.classList.remove('active');
                document.body.classList.remove('sidebar-open');
            }
        }
    });
</script>

</body>
</html>
