package project.ims.dao;

import project.ims.entity.Customer;

/**
 * Created by hello on 7/11/2016.
 */
public interface CustomerDAO extends GenericDAO<Customer> {
    public Customer getCustomer(int id);
}
