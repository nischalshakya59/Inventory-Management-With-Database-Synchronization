package project.ims.dao.impl;

import java.util.List;

import org.eclipse.persistence.internal.expressions.LogicalExpression;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.BrandDAO;
import project.ims.entity.Brand;

@Repository
@Transactional
@Component
public class BrandDAOImpl implements BrandDAO {

	private final SessionFactory sessionFactory;

	@Autowired
	public BrandDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return this.sessionFactory.getCurrentSession();
	}

	@Override
	public List<Brand> getAll() {
		Criteria cr = getCurrentSession().createCriteria(Brand.class);
		List<Brand> hql = cr.list();
		return hql;
	}

	@Override
	public void insert(Brand t) {
		System.out.println("reached here");
			getCurrentSession().save(t);
	}

	@Override
	public void update(Brand t) {
		System.out.println("update method reached");
		getCurrentSession().update(t);

	}

	@Override
	public void delete(int id) {
		System.out.println("delete method reached");
		getCurrentSession().delete(getByID(id));
	}

	@Override
	public Brand getByID(int id) {
		return (Brand) getCurrentSession().get(Brand.class, id);
	}

	@Override
	public List<Brand> getById(int id) {
		throw new UnsupportedOperationException("Not supported yet."); 
	}

	@Override
	public List<Brand> search(Brand t) {
		return null;
	}

}
