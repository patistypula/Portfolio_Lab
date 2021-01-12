package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.donation.DonationService;
import pl.coderslab.charity.institution.InstitutionService;

@Controller
public class HomeController {
    private final DonationService donationService;
    private final InstitutionService institutionService;

    public HomeController(DonationService donationService, InstitutionService institutionService) {
        this.donationService = donationService;
        this.institutionService = institutionService;
    }

    @GetMapping("")
    public String homeAction(Model model){
        model.addAttribute("quantities", donationService.countDonationByQuantity());
        model.addAttribute("donations", donationService.countAllDonation());
        model.addAttribute("institutions", institutionService.getAllInstitution());
        return "index";
    }

    @GetMapping("/logout")
    public String logout(){
        return "logout";
    }
    @PostMapping("/logout")
    public String logOut(){
        return "index";
    }

    @RequestMapping("/remind")
    public String remind(){
        return "remind";
    }
}
