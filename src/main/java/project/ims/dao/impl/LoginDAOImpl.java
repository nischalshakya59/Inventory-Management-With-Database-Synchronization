package project.ims.dao.impl;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import project.ims.dao.LoginDAO;
import project.ims.entity.Login;

import java.util.List;

/**
 * Created by hello on 7/15/2016.
 */
@Repository
@Transactional
public class LoginDAOImpl implements LoginDAO {
    private final SessionFactory sessionFactory;

    @Autowired
    public LoginDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


    private Session getCurrentSession() {

        return this.sessionFactory.getCurrentSession();
    }
    @Override
    public List<Login> getAll() {
        return null;
    }

    @Override
    public void insert(Login login) {
        getCurrentSession().save(login);
        System.out.println("Record Inserted!!");
    }

    @Override
    public void update(Login login){
        getCurrentSession().update(login);
        System.out.println("Login Record Updated");
    }

    @Override
    public void delete(int id) {
        getCurrentSession().delete(getByID(id));
        System.out.println("Login Record Deleted!!");
    }

    @Override
    public Login getByID(int id) {
        return (Login) getCurrentSession().get(Login.class, id);
    }

    @Override
    public List<Login> getById(int id) {
        return null;
    }

    @Override
    public List<Login> search(Login login) {
        return null;
    }


    @Override
    public Login loginUser(String username, String password) {
        Query query = (Query) getCurrentSession().createQuery("FROM Login WHERE username = ?").setString(0, username);
        List<Login> hql = query.list();
        Login login= new Login();
        try{
            System.out.println("......................................................."+hql.get(0));
        }catch(Exception e){
            return null;
        }

        for (Login lg:hql){
            login=lg;
        }
        if(login!=null && login.getPassword().equals(password)){
            return login;
        }
        return null;
    }
}
