/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "order_invoice", catalog = "inventory", schema = "")

public class OrderInvoice implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "order_invoice_id", nullable = false)
    private Integer orderInvoiceId;
    @Column(name = "invoice_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date invoiceDate;
    @JoinColumn(name = "invoice_details_id", referencedColumnName = "invoice_details_id", nullable = false)
    @ManyToOne(optional = false)
    private OrderInvoiceDetails invoiceDetailsId;
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    @ManyToOne(optional = false)
    private Order orderId;

    public OrderInvoice() {
    }

    public OrderInvoice(Integer orderInvoiceId) {
        this.orderInvoiceId = orderInvoiceId;
    }

    public Integer getOrderInvoiceId() {
        return orderInvoiceId;
    }

    public void setOrderInvoiceId(Integer orderInvoiceId) {
        this.orderInvoiceId = orderInvoiceId;
    }

    public Date getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Date invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public OrderInvoiceDetails getInvoiceDetailsId() {
        return invoiceDetailsId;
    }

    public void setInvoiceDetailsId(OrderInvoiceDetails invoiceDetailsId) {
        this.invoiceDetailsId = invoiceDetailsId;
    }

    public Order getOrderId() {
        return orderId;
    }

    public void setOrderId(Order orderId) {
        this.orderId = orderId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderInvoiceId != null ? orderInvoiceId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderInvoice)) {
            return false;
        }
        OrderInvoice other = (OrderInvoice) object;
        if ((this.orderInvoiceId == null && other.orderInvoiceId != null) || (this.orderInvoiceId != null && !this.orderInvoiceId.equals(other.orderInvoiceId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.OrderInvoice[ orderInvoiceId=" + orderInvoiceId + " ]";
    }
    
}
