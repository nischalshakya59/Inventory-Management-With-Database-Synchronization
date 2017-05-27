/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 *
 * @author Alucard
 */
@Entity
@Table(name = "order", catalog = "inventory", schema = "")
@NamedQueries({
    @NamedQuery(name = "Order.findAll", query = "SELECT o FROM Order o")})
public class Order implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "order_id", nullable = false, length = 255)
    private String orderId;
    @Column(name = "sync_status")
    private Boolean syncStatus;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderId")
    private Collection<OrderInvoice> orderInvoiceCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderId")
    private Collection<Cart> cartCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "orderId")
    private Collection<OrderReturn> orderReturnCollection;
    @JoinColumn(name = "order_details_id", referencedColumnName = "order_details_id", nullable = false)
    @ManyToOne(optional = false)
    private OrderDetails orderDetailsId;

    public Order() {
    }

    public Order(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Boolean getSyncStatus() {
        return syncStatus;
    }

    public void setSyncStatus(Boolean syncStatus) {
        this.syncStatus = syncStatus;
    }

    public Collection<OrderInvoice> getOrderInvoiceCollection() {
        return orderInvoiceCollection;
    }

    public void setOrderInvoiceCollection(Collection<OrderInvoice> orderInvoiceCollection) {
        this.orderInvoiceCollection = orderInvoiceCollection;
    }

    public Collection<Cart> getCartCollection() {
        return cartCollection;
    }

    public void setCartCollection(Collection<Cart> cartCollection) {
        this.cartCollection = cartCollection;
    }

    public Collection<OrderReturn> getOrderReturnCollection() {
        return orderReturnCollection;
    }

    public void setOrderReturnCollection(Collection<OrderReturn> orderReturnCollection) {
        this.orderReturnCollection = orderReturnCollection;
    }

    public OrderDetails getOrderDetailsId() {
        return orderDetailsId;
    }

    public void setOrderDetailsId(OrderDetails orderDetailsId) {
        this.orderDetailsId = orderDetailsId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (orderId != null ? orderId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Order)) {
            return false;
        }
        Order other = (Order) object;
        if ((this.orderId == null && other.orderId != null) || (this.orderId != null && !this.orderId.equals(other.orderId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.Order1[ orderId=" + orderId + " ]";
    }
    
}
