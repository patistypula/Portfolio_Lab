package pl.coderslab.charity.institution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public interface InstitutionRepository extends JpaRepository<Institution, Long> {
    @Query("select i from Institution i")
    List<Institution> getAllInstitution();

    Institution getById(long id);
}
