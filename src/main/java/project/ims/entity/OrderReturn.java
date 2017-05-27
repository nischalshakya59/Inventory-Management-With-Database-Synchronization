/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "order_return", catalog = "inventory", schema = "")

public class OrderReturn implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "return_id", nullable = false)
    private Integer returnId;
    @JoinColumn(name = "return_details_id", referencedColumnName = "return_details_id", nullable = false)
    @ManyToOne(optional = false)
    private OrderReturnDetails returnDetailsId;
    @JoinColumn(name = "order_id", referencedColumnName = "order_id", nullable = false)
    @ManyToOne(optional = false)
    private Order orderId;

    public OrderReturn() {
    }

    public OrderReturn(Integer returnId) {
        this.returnId = returnId;
    }

    public Integer getReturnId() {
        return returnId;
    }

    public void setReturnId(Integer returnId) {
        this.returnId = returnId;
    }

    public OrderReturnDetails getReturnDetailsId() {
        return returnDetailsId;
    }

    public void setReturnDetailsId(OrderReturnDetails returnDetailsId) {
        this.returnDetailsId = returnDetailsId;
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
        hash += (returnId != null ? returnId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderReturn)) {
            return false;
        }
        OrderReturn other = (OrderReturn) object;
        if ((this.returnId == null && other.returnId != null) || (this.returnId != null && !this.returnId.equals(other.returnId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.OrderReturn[ returnId=" + returnId + " ]";
    }
    
}
