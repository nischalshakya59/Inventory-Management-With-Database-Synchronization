/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(catalog = "inventory", schema = "")
@XmlRootElement

public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "product_id", nullable = false)
    private Integer productId;
    @Size(max = 32)
    @Column(name = "product_name", length = 32)
    private String productName;
    @Size(max = 255)
    @Column(name = "product_image", length = 255)
    private String productImage;
    @Size(max = 255)
    @Column(name = "product_description", length = 255)
    private String productDescription;
    @Column(name = "product_price")
    private Integer productPrice;
    @Column(name = "product_quantity")
    private Integer productQuantity;
    @Size(max = 255)
    @Column(name = "product_attribute", length = 255)
    private String productAttribute;
    @Column(name = "product_entrydate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date productEntrydate;
    @Column(name = "product_modifieddate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date productModifieddate;
    @Column(name = "product_reorder_level")
    private Integer productReorderLevel;
    @Column(name = "brand_id")
    private Integer brandId;
    @Column(name = "supplier_id")
    private Integer supplierId;
    @JoinTable(name = "product_supplier", joinColumns = {
        @JoinColumn(name = "Productproduct_id", referencedColumnName = "product_id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "Suppliersupplier_id", referencedColumnName = "supplier_id", nullable = false)})
    @ManyToMany
    private Collection<Supplier> supplierCollection;
    @JoinTable(name = "product_brand", joinColumns = {
        @JoinColumn(name = "Productproduct_id", referencedColumnName = "product_id", nullable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "Brandbrand_id", referencedColumnName = "brand_id", nullable = false)})
    @ManyToMany
    private Collection<Brand> brandCollection;
    @JoinColumn(name = "category_id", referencedColumnName = "category_id", nullable = false)
    @ManyToOne(optional = false)
    private Category categoryId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<Cart> cartCollection;

    public Product() {
    }

    public Product(Integer productId) {

        this.productId = productId;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Integer getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Integer productPrice) {
        this.productPrice = productPrice;
    }

    public Integer getProductQuantity() {
        return productQuantity;
    }

    public void setProductQuantity(Integer productQuantity) {
        this.productQuantity = productQuantity;
    }

    public String getProductAttribute() {
        return productAttribute;
    }

    public void setProductAttribute(String productAttribute) {
        this.productAttribute = productAttribute;
    }

    public Date getProductEntrydate() {
        return productEntrydate;
    }

    public void setProductEntrydate(Date productEntrydate) {
        this.productEntrydate = productEntrydate;
    }

    public Date getProductModifieddate() {
        return productModifieddate;
    }

    public void setProductModifieddate(Date productModifieddate) {
        this.productModifieddate = productModifieddate;
    }

    public Integer getProductReorderLevel() {
        return productReorderLevel;
    }

    public void setProductReorderLevel(Integer productReorderLevel) {
        this.productReorderLevel = productReorderLevel;
    }

    public Integer getBrandId() {
        return brandId;
    }

    public void setBrandId(Integer brandId) {
        this.brandId = brandId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    @XmlTransient
    public Collection<Supplier> getSupplierCollection() {
        return supplierCollection;
    }

    public void setSupplierCollection(Collection<Supplier> supplierCollection) {
        this.supplierCollection = supplierCollection;
    }

    @XmlTransient
    public Collection<Brand> getBrandCollection() {
        return brandCollection;
    }

    public void setBrandCollection(Collection<Brand> brandCollection) {
        this.brandCollection = brandCollection;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    @XmlTransient
    public Collection<Cart> getCartCollection() {
        return cartCollection;
    }

    public void setCartCollection(Collection<Cart> cartCollection) {
        this.cartCollection = cartCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.Product[ productId=" + productId + " ]";
    }
    
}
