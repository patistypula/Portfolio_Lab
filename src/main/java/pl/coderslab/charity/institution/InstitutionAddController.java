package pl.coderslab.charity.institution;

import lombok.AllArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.user.CurrentUser;
import pl.coderslab.charity.user.User;

@Controller
@AllArgsConstructor
@Secured("ROLE_ADMIN")
@RequestMapping("/institution")
public class InstitutionAddController {
    private final InstitutionService institutionService;

    @GetMapping("/add")
    public String add(Model model){
        model.addAttribute("institutions", new Institution());
        return "institutions/form";
    }

    @PostMapping("/add")
    public String addNewOne (@ModelAttribute ("institutions") Institution institution,
                             BindingResult result){
        if(result.hasErrors()){
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
