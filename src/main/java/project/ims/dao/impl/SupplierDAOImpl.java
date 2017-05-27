package project.ims.dao.impl;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.ims.dao.SupplierDAO;
import project.ims.entity.Supplier;

@Transactional
@Repository
public class SupplierDAOImpl implements SupplierDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public SupplierDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public List<Supplier> getAll() {
        Criteria cr = getCurrentSession().createCriteria(Supplier.class);
        List<Supplier> hql = cr.list();        
        return hql;
    }

    @Override
    public void insert(Supplier t) {
        System.out.println("supplier insert method reached");
        getCurrentSession().save(t);

    }

    @Override
    public void update(Supplier t) {
        System.out.println("supplier update method reached");
        getCurrentSession().update(t);
    }

    @Override
    public void delete(int id) {
        System.out.println("supplier delete method reached");
        getCurrentSession().delete(getByID(id));
    }

    @Override
    public Supplier getByID(int id) {
        return (Supplier) getCurrentSession().get(Supplier.class, id);
    }

    @Override
    public List<Supplier> getById(int id) {
        Query query = (Query) getCurrentSession().createQuery("FROM Supplier WHERE supplierId = ?").setInteger(0, id);
        List<Supplier> hql = query.list();        
        return hql;
    }   

    @Override
    public List<Supplier> search(Supplier t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
