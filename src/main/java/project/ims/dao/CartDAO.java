package project.ims.dao;


import project.ims.entity.Cart;

import java.util.List;

public interface CartDAO extends GenericDAO<Cart> {
    public Double calculateTotal(List<Cart> cartList);
}
