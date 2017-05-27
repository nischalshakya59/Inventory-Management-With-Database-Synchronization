package project.ims.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.OrderDAO;
import project.ims.entity.Cart;
import project.ims.entity.Order;

import java.util.List;

/**
 * Created by Sabin on 2016-08-31.
 */
@Repository
@Transactional
@Component

public class OrderDAOImpl implements OrderDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public OrderDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {return this.sessionFactory.getCurrentSession();}

    @Override
    public List<Order> getAll() {
        Query query = (Query) getCurrentSession().createQuery("FROM Order");
        List<Order> hql = query.list();
        return hql;

    }

    @Override
    public void insert(Order order) {
        getCurrentSession().save(order);
    }

    @Override
    public void update(Order order) {
        getCurrentSession().update(order);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Order getByID(int id) {
        return (Order) getCurrentSession().get(Order.class,id);
    }

    @Override
    public List<Order> getById(int id) {
        Query query = (Query) getCurrentSession().createQuery("FROM Order WHERE order_id = ?").setInteger(0, id);
        List<Order> hql = query.list();
        return hql;
    }

    @Override
    public List<Order> search(Order order) {
        return null;
    }

}
