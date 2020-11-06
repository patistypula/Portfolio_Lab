package pl.coderslab.charity.institution;

import lombok.AllArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.charity.user.CurrentUser;
import pl.coderslab.charity.user.User;

@Controller
@Secured("ROLE_ADMIN")
@AllArgsConstructor
@RequestMapping("/institution")
public class InstitutionEditController {
    private final InstitutionService institutionService;

    @GetMapping("/edit/{id}")
    public String edit (@PathVariable long id, Model model){
        Institution institution = institutionService.getById(id);
        model.addAttribute("institutions", institution);
        return "institutions/form";
    }

    @PostMapping("/edit/{id}")
    public String editInst(@PathVariable long id, @ModelAttribute Institution
                           institution, BindingResult result) {
        if (result.hasErrors()){
            return "institutions/form";
        }
        institutionService.save(institution);
        return "redirect:/admin/institution/all";
    }

    @ModelAttribute("currentUser")
    public String name(@AuthenticationPrincipal CurrentUser currentUser){
        User entityUser = currentUser.getUser();
        return entityUser.getUsername();
    }
}
