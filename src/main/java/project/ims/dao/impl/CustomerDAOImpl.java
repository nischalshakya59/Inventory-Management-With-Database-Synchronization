package project.ims.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.CustomerDAO;
import project.ims.entity.Customer;

import java.util.List;

import static org.springframework.data.jpa.domain.AbstractPersistable_.id;

/**
 * Created by hello on 7/11/2016.
 */
@Repository
@Transactional
public class CustomerDAOImpl implements CustomerDAO {
    private final SessionFactory sessionFactory;

    @Autowired
    public CustomerDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {

        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public List<Customer> getAll() {
        Query query = (Query) getCurrentSession().createQuery("FROM Customer");
        List<Customer> hql = query.list();
        return hql;
    }

    @Override
    public void insert(Customer customer) {

        getCurrentSession().save(customer);
        System.out.println("Record Inserted!!");
    }

    @Override
    public void update(Customer customer) {
        getCurrentSession().update(customer);
        System.out.println("Customer Record Updated");
    }

    @Override
    public void delete(int id) {
        getCurrentSession().delete(getByID(id));
        System.out.println("Customer Record Deleted!!");
    }

    @Override
    public Customer getByID(int id) {
        return (Customer) getCurrentSession().get(Customer.class, id);
    }

    @Override
    public List<Customer> getById(int id) {
        Query query = (Query) getCurrentSession().createQuery("FROM Customer WHERE customerId = ?").setInteger(0, id);
        List<Customer> hql = query.list();
        return hql;
    }

    @Override
    public List<Customer> search(Customer customer) {
        return null;
    }

    public Customer getCustomer(int id){
        Query query = (Query) getCurrentSession().createQuery("FROM Customer WHERE loginId = ?").setInteger(0, id);
        List<Customer> hql = query.list();
        Customer cus=new Customer();
        for (Customer customer:hql){
            cus=customer;
        }
        return cus;
    }
}
