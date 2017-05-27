package project.ims.dao;

import org.springframework.web.multipart.MultipartFile;
import project.ims.entity.Product;

import java.util.Date;
import java.util.List;

public interface ProductDAO extends GenericDAO<Product>{

    public List<String> getAllImage();
    public String imagesplit(String filename);
    public String fileWorks(MultipartFile file);
}
