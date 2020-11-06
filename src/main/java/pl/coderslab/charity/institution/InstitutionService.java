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

    public Institution getById(long id){
        return institutionRepository.getById(id);
    }

    public Institution save(Institution institution) {
        return institutionRepository.save(institution);
    }

}
