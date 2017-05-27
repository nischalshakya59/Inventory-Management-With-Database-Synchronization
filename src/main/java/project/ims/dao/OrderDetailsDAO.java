package project.ims.dao;

import project.ims.entity.OrderDetails;

import java.util.List;

/**
 * Created by Sabin on 2016-08-31.
 */
public interface OrderDetailsDAO extends GenericDAO<OrderDetails>  {
    public List<OrderDetails> getSpecific();
    public int getNotificationCount();
}
