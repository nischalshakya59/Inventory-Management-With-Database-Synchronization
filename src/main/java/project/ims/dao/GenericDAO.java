package project.ims.dao;

import java.util.List;

public interface GenericDAO<T> {
    List<T> getAll();
    void insert(T t);
    void update(T t);
    void delete(int id);   
    T getByID(int id);
    List<T> getById(int id);
    List<T> search(T t);
    
}
