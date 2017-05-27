/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;


@Entity
@Table(name = "order_return_details", catalog = "inventory", schema = "")

public class OrderReturnDetails implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "return_details_id", nullable = false)
    private Integer returnDetailsId;
    @Size(max = 32)
    @Column(name = "return_type", length = 32)
    private String returnType;
    @Column(name = "return_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date returnDate;
    @Column(name = "return_quantity")
    private Integer returnQuantity;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "total_amount", precision = 22)
    private Double totalAmount;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "returnDetailsId")
    private Collection<OrderReturn> orderReturnCollection;

    public OrderReturnDetails() {
    }

    public OrderReturnDetails(Integer returnDetailsId) {
        this.returnDetailsId = returnDetailsId;
    }

    public Integer getReturnDetailsId() {
        return returnDetailsId;
    }

    public void setReturnDetailsId(Integer returnDetailsId) {
        this.returnDetailsId = returnDetailsId;
    }

    public String getReturnType() {
        return returnType;
    }

    public void setReturnType(String returnType) {
        this.returnType = returnType;
    }

    public Date getReturnDate() {
        return returnDate;
    }

    public void setReturnDate(Date returnDate) {
        this.returnDate = returnDate;
    }

    public Integer getReturnQuantity() {
        return returnQuantity;
    }

    public void setReturnQuantity(Integer returnQuantity) {
        this.returnQuantity = returnQuantity;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }

    @XmlTransient
    public Collection<OrderReturn> getOrderReturnCollection() {
        return orderReturnCollection;
    }

    public void setOrderReturnCollection(Collection<OrderReturn> orderReturnCollection) {
        this.orderReturnCollection = orderReturnCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (returnDetailsId != null ? returnDetailsId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderReturnDetails)) {
            return false;
        }
        OrderReturnDetails other = (OrderReturnDetails) object;
        if ((this.returnDetailsId == null && other.returnDetailsId != null) || (this.returnDetailsId != null && !this.returnDetailsId.equals(other.returnDetailsId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.OrderReturnDetails[ returnDetailsId=" + returnDetailsId + " ]";
    }
    
}
