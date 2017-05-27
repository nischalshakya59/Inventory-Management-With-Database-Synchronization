package project.ims.dao.impl;

import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.AddressDAO;
import project.ims.entity.Address;

@Repository
@Transactional
public class AddressDAOImpl implements AddressDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public AddressDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public List<Address> getAll() {
        Criteria cr = getCurrentSession().createCriteria(Address.class);
        List<Address> hql = cr.list();
        return hql;
    }

    @Override
    public void insert(Address t) {
        getCurrentSession().save(t);
    }

    @Override
    public void update(Address t) {
        System.out.println("update method reached");
        getCurrentSession().update(t);
    }

    @Override
    public void delete(int id) {
        System.out.println("address delete method reached");
        getCurrentSession().delete(getByID(id));
    }

    @Override
    public Address getByID(int id) {
        return (Address) getCurrentSession().get(Address.class, id);
    }

    @Override
    public List<Address> getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Address> search(Address t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
