package control.chat;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import context.DBContext;

@ServerEndpoint("/chat/{guiTu}/{guiDen}")
public class ChatEndpoint {

    // Lưu tất cả session theo tên người dùng
    private static ConcurrentHashMap<String, Session> users = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session, @PathParam("guiTu") String guiTu, @PathParam("guiDen") String guiDen) {
        session.getUserProperties().put("guiTu", guiTu);
        session.getUserProperties().put("guiDen", guiDen);
        users.put(guiTu, session); // Lưu session theo tên người gửi
        sendOldMessages(session, guiTu, guiDen);
        updateTrangThai(guiTu, "Online");

    }

    @OnMessage
    public void onMessage(String message, Session session) {
        String guiTu = (String) session.getUserProperties().get("guiTu");
        String guiDen = (String) session.getUserProperties().get("guiDen");

        saveToDB(guiTu, guiDen, message);

        // Gửi định dạng: "senderId:message"
        String fullMessage = guiTu + ":" + message;
        sendToUser(guiTu, fullMessage); // gửi lại cho chính người gửi
        sendToUser(guiDen, fullMessage); // gửi đến người nhận
    }

    @OnClose
    public void onClose(Session session) {
        String guiTu = (String) session.getUserProperties().get("guiTu");
        users.remove(guiTu);
        updateTrangThai(guiTu, "Offline");
    }

    // Gửi tin nhắn đến một user (nếu đang online)
    private void sendToUser(String user, String message) {
        Session s = users.get(user);
        if (s != null && s.isOpen()) {
            try {
                s.getBasicRemote().sendText(message); // không thêm emoji
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    // Lưu tin nhắn vào database
    private void saveToDB(String guiTu, String guiDen, String message) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "INSERT INTO TinNhan (GuiTu, GuiDen, NoiDung) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, guiTu);
            ps.setString(2, guiDen);
            ps.setString(3, message);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Gửi lại toàn bộ tin nhắn cũ theo định dạng: "senderId:message"
    private void sendOldMessages(Session session, String a, String b) {
        try (Connection conn = DBContext.getConnection()) {
            String sql = "SELECT * FROM TinNhan WHERE (GuiTu=? AND GuiDen=?) OR (GuiTu=? AND GuiDen=?) ORDER BY ThoiGian ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, a);
            ps.setString(2, b);
            ps.setString(3, b);
            ps.setString(4, a);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String sender = rs.getString("GuiTu");
                String msg = rs.getString("NoiDung");
                session.getBasicRemote().sendText(sender + ":" + msg); // đúng định dạng
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void updateTrangThai(String idND, String trangThai) {
    try (Connection conn = DBContext.getConnection()) {
        String sql = "UPDATE NguoiDung SET TrangThai = ? WHERE ID_ND = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, trangThai);
        ps.setString(2, idND);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}
