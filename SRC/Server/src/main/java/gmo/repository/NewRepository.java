package gmo.repository;

import gmo.model.Doc;
import gmo.model.New;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

/**
 * Created by Quang Minh on 8/3/2016.
 */
@RepositoryRestResource
public interface NewRepository extends JpaRepository<New, Long> {
    Page<New> findByTitleContainingOrderByIdDesc(String title, Pageable pageable);

    Page<New> findAllByOrderByIdDesc(Pageable pageable);
}
