package project.ims.dao.impl;

import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import project.ims.entity.UserDetails;
import project.ims.dao.UserDAO;

@Transactional
@Repository
public class UserDAOImpl implements UserDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public UserDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession() {
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public List<UserDetails> getAll() {
        Criteria cr = getCurrentSession().createCriteria(UserDetails.class);
        List<UserDetails> hql = cr.list();
        return hql;
    }

    @Override
    public void insert(UserDetails t) {
        System.out.println("supplier insert reached");
        getCurrentSession().save(t);
    }

    @Override
    public void update(UserDetails t) {
        System.out.println("user details update method reached");
        getCurrentSession().update(t);
    }

    @Override
    public void delete(int id) {
        System.out.println("userdetails delete method reached");
        getCurrentSession().delete(getByID(id));
    }

    @Override
    public UserDetails getByID(int id) {
        return (UserDetails) getCurrentSession().get(UserDetails.class, id);
    }

    @Override
    public List<UserDetails> getById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<UserDetails> search(UserDetails t) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
