<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h3 class="mb-4">Quản lý bàn ăn</h3>
<div class="row">
  <c:forEach var="ban" items="${listBan}">
    <div class="col-lg-3 col-md-4 col-sm-6">
      <div class="table-card">
        <h5>${ban.tenBan}</h5>
        <div>${ban.vitri}</div>
        <div>${ban.trangthai}</div>
      </div>
    </div>
  </c:forEach>
</div>
