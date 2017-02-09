package gmo.controller;

import gmo.configuration.AppConfig;
import gmo.model.Doc;
import gmo.model.New;
import gmo.model.User;
import gmo.repository.NewRepository;
import gmo.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.Date;

/**
 * Created by Quang Minh on 8/3/2016.
 */
@RestController
public class NewController {
    @Autowired
    NewRepository newRepository;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    UserRepository userRepository;


    @RequestMapping(path = "/news/{id}", method = RequestMethod.GET)
    ResponseEntity<?> getNewById(
            @PathVariable(value = "id") long id
    ) {
        New n = newRepository.findOne(id);
        if (n == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        } else {
            return ResponseEntity.ok(n);
        }
    }

    @RequestMapping(path = "/news/searchByTitle", method = RequestMethod.GET)
    ResponseEntity<?> searchByName(
            @RequestParam(value = "title", required = false, defaultValue = "") String title,
            @RequestParam(value = "page", required = false, defaultValue = "0") int page,
            @RequestParam(value = "size", required = false, defaultValue = "15") int size
    ) {
        Pageable pageable = new PageRequest(page, size);
        Page<New> testEntities = newRepository.findByTitleContainingOrderByIdDesc(title, pageable);
       /* if(testEntities.getTotalElements()==0){
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
        }*/
        return ResponseEntity.ok(testEntities);
    }

    @RequestMapping(path = "/news", method = RequestMethod.GET)
    ResponseEntity<?> getNews(
            @RequestParam(value = "page", required = false, defaultValue = "0") int page,
            @RequestParam(value = "size", required = false, defaultValue = "15") int size

    ) {
        Pageable pageable = new PageRequest(page, size);
        Page<New> groupPage = newRepository.findAllByOrderByIdDesc(pageable);
        //return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);

        /*if(groupPage.getTotalElements()==0){
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(null);
        }*/
        return ResponseEntity.ok(groupPage);

    }

    @RequestMapping(path = "/news", method = RequestMethod.POST)
    ResponseEntity<?> addNew(
            @RequestBody New a

    ) throws URISyntaxException {
        if (a.getTitle().compareTo("") == 0 || a.getBody().compareTo("") == 0 || a.getUser() != null) {


            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);

        } else {
            User user = (User) request.getAttribute("true_user");
            Date date = new Date(System.currentTimeMillis());
            a.setCreateTime(date);
            user.getListnew().add(a);
            a.setUser(user);
            userRepository.save(user);
            return ResponseEntity.status(HttpStatus.CREATED).body(a);

        }

        //return ResponseEntity.status(HttpStatus.CREATED).body(a);

    }


}
