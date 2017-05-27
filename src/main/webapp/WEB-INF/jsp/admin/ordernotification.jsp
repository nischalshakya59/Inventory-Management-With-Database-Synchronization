<%--
  Created by IntelliJ IDEA.
  User: hello
  Date: 9/7/2016
  Time: 11:05 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<table>

    <c:forEach var="orders" items="${allorder}">
        <c:forEach var="orderDS" items="${allorderD}">
            <c:choose>
                <c:when test="${orders.orderDetailsId.orderDetailsId == orderDS.orderDetailsId}">
                    <tr>
                        <td>
                            Order No.: ${orders.orderDetailsId.orderDetailsId}
                        </td>
                        <td>
                            Customer Name:
                            <%--${orderDS.customerId.firstName}--%>
                        </td>
                        <td>
                            Date : ${ orderDS.orderDate}
                        </td>
                    </tr>

                    <tr>
                        <table>
                            <tr>
                                <th>Product</th>
                                <th>Quantity</th>
                            </tr>
                            <c:forEach var="allcart" items="${allcart}">
                                <c:choose>
                                    <c:when test="${allcart.orderId.orderId == orders.orderId}">
                                        <tr>
                                            <td>
                                                ${allcart.productId.productName}
                                            </td>
                                            <td>
                                                ${allcart.quantity}
                                            </td>
                                        </tr>
                                    </c:when>
                                </c:choose>
                            </c:forEach>

                        </table>

                    </tr>
                </c:when>
            </c:choose>
        </c:forEach>

    </c:forEach>

</table>
</html>
