/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.ims.entity;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(catalog = "inventory", schema = "")

public class Admin implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "admin_id", nullable = false)
    private Integer adminId;
    @JoinColumn(name = "login_id", referencedColumnName = "login_id", nullable = false)
    @ManyToOne(optional = false)
    private Login loginId;
    @JoinColumn(name = "userdetails_id", referencedColumnName = "userdetails_id", nullable = false)
    @ManyToOne(optional = false)
    private UserDetails userdetailsId;

    public Admin() {
    }

    public Admin(Integer adminId) {
        this.adminId = adminId;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public Login getLoginId() {
        return loginId;
    }

    public void setLoginId(Login loginId) {
        this.loginId = loginId;
    }

    public UserDetails getUserdetailsId() {
        return userdetailsId;
    }

    public void setUserdetailsId(UserDetails userdetailsId) {
        this.userdetailsId = userdetailsId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminId != null ? adminId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admin)) {
            return false;
        }
        Admin other = (Admin) object;
        if ((this.adminId == null && other.adminId != null) || (this.adminId != null && !this.adminId.equals(other.adminId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "project.ims.entity.Admin[ adminId=" + adminId + " ]";
    }
    
}
