package project.ims.dao.impl;


import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import project.ims.dao.ProductDAO;
import project.ims.entity.Product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO{

    private final SessionFactory sessionFactory;
    private Session session;

    @Autowired
    public ProductDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session getCurrentSession(){
        return this.sessionFactory.getCurrentSession();
    }

    @Override
    public List<Product> getAll() {
        Query query = (Query) getCurrentSession().createQuery("FROM Product");
        List<Product> hql = query.list();

        for(Product product : hql){
            System.out.println("Id " +product.getProductId()+
                            "Product Name" +product.getProductName()+
                            "Product Description" + product.getProductDescription() +
                            "Product Attribute" + product.getProductAttribute()+
                            "Product Price"+ product.getProductPrice()+
                            "Product Quantity" + product.getProductQuantity() +
                            "Product Entry Date" + product.getProductEntrydate() +
                            "Product Modified Date" + product.getProductModifieddate() +
//                          "Product Image" + product.getProductImage() +
                            "Reorder Level " + product.getProductReorderLevel()

            );
        }
        return hql;
    }

    @Override
    public void insert(Product product) {
        System.out.println("eta pugyo");
        getCurrentSession().save(product);
    }

    @Override
    public void update(Product product) {
        getCurrentSession().update(product);
    }

    @Override
    public void delete(int id) {
        for (Product product:getById(id)){
            getCurrentSession().delete(product);
        }
    }

    @Override
    public Product getByID(int id) {
        return (Product) getCurrentSession().get(Product.class,id);

    }

    @Override
    public List<Product> getById(int id) {
        Query query = (Query) getCurrentSession().createQuery("FROM Product WHERE productId = ?").setInteger(0, id);
        List<Product> hql = query.list();
        return hql;
    }

    @Override
    public List<Product> search(Product product) {
        return null;
    }

    @Override
    public List<String> getAllImage() {
        Query query = (Query) getCurrentSession().createQuery("SELECT p.productImage FROM Product p");
        System.out.println(" query pachi ");
        List<String> list = query.list();

        System.out.println("list pachi ");
        return list;
    }

    @Override
    public String imagesplit(String filename) {
        String imagename = filename;
        System.out.println("method ko imagename = " + imagename);

        String imagee[] = imagename.split("webapp");
        String crap = imagee[0];
        System.out.println("crap= " + crap);
        String imagepath = imagee[1];
        System.out.println("path= " + imagepath);

        return imagepath;
    }

    public String fileWorks(MultipartFile file){
        String fileName = null;
        File serverFile;
        String imagefile = null;

        if (!file.isEmpty()) {
            try {

                fileName = file.getOriginalFilename();
                System.out.println("filename k aayo = " + fileName);
                byte[] bytes = file.getBytes();

                String rootPath = System.getProperty("user.dir");
                System.out.println("rootpath = " + rootPath);

                File dir = new File(rootPath + File.separator + "src\\main\\webapp\\public\\" + "ProductImage");
                System.out.println("Dir ko value: " + dir);
                if (!dir.exists())
                    dir.mkdirs();

                // Create the file on server
                serverFile = new File(dir.getAbsolutePath()
                        + File.separator + fileName);

                System.out.println("server file ko value = " + serverFile);
                imagefile = String.valueOf(serverFile);
                BufferedOutputStream buffStream =
                        new BufferedOutputStream(new FileOutputStream(serverFile));
                buffStream.write(bytes);
                buffStream.close();
                //return "You have successfully uploaded " + fileName;
            } catch (Exception e) {
                //return "You failed to upload " + fileName + ": " + e.getMessage();
            }
        }
        System.out.println("image file name = " + imagefile);
        return imagefile;


    }

}
