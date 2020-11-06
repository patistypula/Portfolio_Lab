package pl.coderslab.charity.institution;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class InstitutionService {
    private final InstitutionRepository institutionRepository;

    public InstitutionService(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    public List<Institution> getAllInstitution() {
        return institutionRepository.getAllInstitution();
    }

    public void addInstitution(Institution institution) {

    }

    public Institution findInstitutionById(Long id) {
        return null;
    }

    public void updateInstitution(Institution institution) {

    }

    public void deleteInstitutionById(Long id) {

    }
}
