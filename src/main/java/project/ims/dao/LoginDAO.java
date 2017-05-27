package project.ims.dao;

import project.ims.entity.Login;

/**
 * Created by hello on 7/15/2016.
 */
public interface LoginDAO extends GenericDAO<Login> {

    public Login loginUser(String username, String password);
}
