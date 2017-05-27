package project.ims.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.CartDAO;
import project.ims.entity.Cart;
import project.ims.entity.Customer;

import java.util.List;

@Repository
@Transactional
public class CartDAOImpl implements CartDAO {
    private final SessionFactory sessionFactory;

    @Autowired
    public CartDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }
    @Override
    public List<Cart> getAll() {
        Query query = (Query) getCurrentSession().createQuery("FROM Cart");
        List<Cart> hql = query.list();
        return hql;
    }

    @Override
    public void insert(Cart cart) {
        getCurrentSession().save(cart);
    }

    @Override
    public void update(Cart cart) {

    }

    @Override
    public void delete(int id) {

    }

    @Override
    public Cart getByID(int id) {
        return null;
    }

    @Override
    public List<Cart> getById(int id) {
        String order_id="on_"+String.valueOf(id);
        Query query = (Query) getCurrentSession().createQuery("FROM Cart WHERE order_id= ?").setString(0, order_id);
        List<Cart> hql = query.list();
        return hql;
    }

    @Override
    public List<Cart> search(Cart cart) {
        return null;
    }


    @Override
    public Double calculateTotal(List<Cart> cartList) {
        Double total=0.0;
        for(Cart c:cartList){
            total=total+(c.getProductId().getProductPrice() * c.getQuantity());
        }
        return total;
    }
}
