<%@include file="/WEB-INF/jsp/customerwebpage/header.jsp"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="container">
    <c:forEach var="orderD" items="${allorderdetails}">
        <c:forEach var="orders" items="${allorder}">
            <c:choose>
                <c:when test="${orders.orderDetailsId.orderDetailsId == orderD.orderDetailsId}">
                    <table class="table table-responsive table-striped">
                        <%--table headings--%>
                        <th class="col-md-9">Order</th>
                        <th>Status</th>

                        <tr>
                            <%--order date--%>
                            <td>
                                Date :${orderD.orderDate}
                            </td>

                            <%--status info--%>
                            <td>
                                <c:choose>
                                    <c:when test="${orders.syncStatus}">
                                        Delivered
                                    </c:when>
                                    <c:otherwise>
                                        Pending
                                    </c:otherwise>
                                </c:choose>
                            </td>
                        </tr>

                        <%--<tr>--%>
                            <%--<td>--%>
                                <table class="table">
                                    <th class="col-md-9">Product</th>
                                    <th>Quantity</th>
                                    <c:forEach var="ct" items="${allcart}">
                                        <c:choose>
                                            <c:when test="${orders.orderId==ct.orderId.orderId}">
                                                <tr>
                                                    <td>
                                                        ${ct.productId.productName}
                                                    </td>

                                                    <td >
                                                        ${ct.quantity}
                                                    </td>
                                                </tr>
                                            </c:when>
                                        </c:choose>
                                    </c:forEach>
                                </table>
                            <%--</td>--%>
                        <%--</tr>--%>
                    </table><br><br>
                </c:when>
            </c:choose>
        </c:forEach>
    </c:forEach>
</div>

<%@include file="/WEB-INF/jsp/customerwebpage/footer.jsp"%>

