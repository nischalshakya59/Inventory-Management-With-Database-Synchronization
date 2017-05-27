package project.ims.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.OrderDetailsDAO;
import project.ims.entity.Customer;
import project.ims.entity.OrderDetails;

import java.util.List;

/**
 * Created by Sabin on 2016-08-31.
 */

@Repository
@Transactional
@Component

public class OrderDetailsDAOImpl implements OrderDetailsDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public OrderDetailsDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {return this.sessionFactory.getCurrentSession();}

    @Override
    public List<OrderDetails> getAll() {
        Query query = (Query) getCurrentSession().createQuery("FROM OrderDetails");
        List<OrderDetails> hql = query.list();
        return hql;
    }

    @Override
    public void insert(OrderDetails orderDetails) {
        getCurrentSession().save(orderDetails);
    }

    @Override
    public void update(OrderDetails orderDetails) {
        getCurrentSession().update(orderDetails);
    }

    @Override
    public void delete(int id) {

    }

    @Override
    public OrderDetails getByID(int id) {
        return (OrderDetails) getCurrentSession().get(OrderDetails.class, id);
    }

    @Override
    public List<OrderDetails> getById(int id) {
        Query query = (Query) getCurrentSession().createQuery("FROM OrderDetails WHERE customer_id= ?").setInteger(0, id);
        List<OrderDetails> hql = query.list();
        return hql;
    }

    @Override
    public List<OrderDetails> search(OrderDetails orderDetails) {
        return null;
    }

    @Override
    public List<OrderDetails> getSpecific() {
        Query query = (Query) getCurrentSession().createQuery("FROM OrderDetails WHERE order_status = ?").setInteger(0, 0);
        List<OrderDetails> hql = query.list();
        return hql;
    }

    @Override
    public int getNotificationCount() {
        int count=0;
        for(OrderDetails orderD:getSpecific()){
            count=count+1;
        }
        return count;
    }
}
