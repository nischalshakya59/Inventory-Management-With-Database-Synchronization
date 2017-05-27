/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(catalog = "inventory", schema = "")

public class Payment implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "payment_id", nullable = false)
    private Integer paymentId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "order_invoice_id", nullable = false)
    private int orderInvoiceId;
    @Column(name = "payment_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentDate;
    @JoinColumn(name = "payment_details_id", referencedColumnName = "payment_details_id", nullable = false)
    @ManyToOne(optional = false)
    private PaymentDetails paymentDetailsId;

    public Payment() {
    }

    public Payment(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public Payment(Integer paymentId, int orderInvoiceId) {
        this.paymentId = paymentId;
        this.orderInvoiceId = orderInvoiceId;
    }

    public Integer getPaymentId() {
        return paymentId;
    }

    public void setPaymentId(Integer paymentId) {
        this.paymentId = paymentId;
    }

    public int getOrderInvoiceId() {
        return orderInvoiceId;
    }

    public void setOrderInvoiceId(int orderInvoiceId) {
        this.orderInvoiceId = orderInvoiceId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public PaymentDetails getPaymentDetailsId() {
        return paymentDetailsId;
    }

    public void setPaymentDetailsId(PaymentDetails paymentDetailsId) {
        this.paymentDetailsId = paymentDetailsId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (paymentId != null ? paymentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Payment)) {
            return false;
        }
        Payment other = (Payment) object;
        if ((this.paymentId == null && other.paymentId != null) || (this.paymentId != null && !this.paymentId.equals(other.paymentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.Payment[ paymentId=" + paymentId + " ]";
    }
    
}
