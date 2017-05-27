package project.ims.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.CategoryDAO;
import project.ims.entity.Category;

import java.util.List;

/**
 * Created by Sabin on 2016-07-19.
 */

@Repository
@Transactional
@Component

public class CategoryDAOImpl implements CategoryDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public CategoryDAOImpl(SessionFactory sessionFactory) {this.sessionFactory=sessionFactory;}

    private Session getCurrentSession() {return this.sessionFactory.getCurrentSession();}

    @Override
    public List<Category> getAll() {
        Query query = (Query) getCurrentSession().createQuery("FROM Category");
        List<Category> hql = query.list();
        return hql;
    }

    @Override
    public void insert(Category category) {
        getCurrentSession().save(category);
    }

    @Override
    public void update(Category category) {
        System.out.println("Edit ko part");
        getCurrentSession().update(category);
    }

    @Override
    public void delete(int id) {
        System.out.println("delete ko part");
        for (Category cat:getById(id)){
            getCurrentSession().delete(cat);
        }

    }

    @Override
    public Category getByID(int id) {
        return (Category) getCurrentSession().get(Category.class,id);
    }

    @Override
    public List<Category> getById(int id) {
        Query query = (Query) getCurrentSession().createQuery("FROM Category WHERE categoryId = ?").setInteger(0, id);
        List<Category> hql = query.list();
        return hql;
    }

    @Override
    public List<Category> search(Category category) {
        return null;
    }
}
