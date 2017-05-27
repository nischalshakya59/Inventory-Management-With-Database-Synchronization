/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Collection;

@Entity
@Table(name = "order_invoice_details", catalog = "inventory", schema = "")

public class OrderInvoiceDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "invoice_details_id", nullable = false)
    private Integer invoiceDetailsId;
    @Column(name = "order_id")
    private Integer orderId;
    @Column(name = "product_id")
    private Integer productId;
    private Integer rate;
    @Column(name = "order_quantity")
    private Integer orderQuantity;
    @Column(name = "invoice_date")
    private Integer invoiceDate;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "tax_rate", precision = 22)
    private Double taxRate;
    private Integer discount;
    @Column(name = "total_amount", precision = 22)
    private Double totalAmount;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "invoiceDetailsId")
    private Collection<OrderInvoice> orderInvoiceCollection;

    public OrderInvoiceDetails() {
    }

    public OrderInvoiceDetails(Integer invoiceDetailsId) {
        this.invoiceDetailsId = invoiceDetailsId;
    }

    public Integer getInvoiceDetailsId() {
        return invoiceDetailsId;
    }

    public void setInvoiceDetailsId(Integer invoiceDetailsId) {
        this.invoiceDetailsId = invoiceDetailsId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getRate() {
        return rate;
    }

    public void setRate(Integer rate) {
        this.rate = rate;
    }

    public Integer getOrderQuantity() {
        return orderQuantity;
    }

    public void setOrderQuantity(Integer orderQuantity) {
        this.orderQuantity = orderQuantity;
    }

    public Integer getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(Integer invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public Double getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(Double taxRate) {
        this.taxRate = taxRate;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @XmlTransient
    public Collection<OrderInvoice> getOrderInvoiceCollection() {
        return orderInvoiceCollection;
    }

    public void setOrderInvoiceCollection(Collection<OrderInvoice> orderInvoiceCollection) {
        this.orderInvoiceCollection = orderInvoiceCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (invoiceDetailsId != null ? invoiceDetailsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderInvoiceDetails)) {
            return false;
        }
        OrderInvoiceDetails other = (OrderInvoiceDetails) object;
        if ((this.invoiceDetailsId == null && other.invoiceDetailsId != null) || (this.invoiceDetailsId != null && !this.invoiceDetailsId.equals(other.invoiceDetailsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.OrderInvoiceDetails[ invoiceDetailsId=" + invoiceDetailsId + " ]";
    }
    
}
