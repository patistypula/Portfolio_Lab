package pl.coderslab.charity.institution;

import lombok.AllArgsConstructor;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.user.CurrentUser;
import pl.coderslab.charity.user.User;

@Controller
@Secured("ROLE_ADMIN")
@AllArgsConstructor
@RequestMapping("/admin/institution")
public class InstitutionAllController {
    private final InstitutionService institutionService;

    @GetMapping("/all")
    public String showAll(Model model){
        model.addAttribute("institutions", institutionService.getAllInstitution());
        return "institutions/all";
    }

    @ModelAttribute("currentUser")
    public String name(@AuthenticationPrincipal CurrentUser currentUser){
        User entityUser = currentUser.getUser();
        return entityUser.getUsername();
    }

}
