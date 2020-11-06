package pl.coderslab.charity.institution;

import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.donation.Donation;

import javax.validation.Valid;
import java.net.URI;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/institutions")
public class InstitutionRestController {

    private final InstitutionService institutionService;

    @GetMapping
    public List<Institution> getAllInstitutions() {
        return institutionService.getAllInstitution();
    }

    @PostMapping
    // 201 Created + Location Header z adresem nowo utworzonego zasobu
    public ResponseEntity saveInstitution(@Valid @RequestBody Institution institution) {
        institutionService.addInstitution(institution);
        return ResponseEntity.created(URI.create("/api/institutions/" + institution.getId())).build();
    }

    @GetMapping("/{id}")
    public ResponseEntity getOne(@PathVariable Long id) {
        Institution institution = institutionService.findInstitutionById(id);
        if (institution != null) {
            return ResponseEntity.ok(institution);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PutMapping("/{id}")
    public void saveEditedInstitution(@PathVariable Long id, @Valid @RequestBody Institution institution) {
        institutionService.updateInstitution(institution);
    }

    @DeleteMapping("/{id}")
    // 200 OK
    // 204 No content
    public void deleteInstitutionById(@PathVariable Long id){
        institutionService.deleteInstitutionById(id);
    }

    @GetMapping("/{id}/donations")
    public List<Donation> donations(@PathVariable Long id) {
        return null;
    }
}